# frozen_string_literal: true

# app/controllers/api/users/omniauth_callbacks_controller.rb
module Api
  module Users
    class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
      def redirect_callbacks
        devise_mapping = getting_devise_mapping
        redirect_route = get_redirect_route(devise_mapping)

        session['dta.omniauth.auth'] = request.env['omniauth.auth'].except('extra')
        session['dta.omniauth.params'] = request.env['omniauth.params']
        redirect_to redirect_route
      end

      def omniauth_success
        super
        update_auth_header
      end

      protected

      def get_resource_from_auth_hash
        super
        # @resource.credentials = auth_hash["credentials"]
        clean_resource
      end

      def render_data_or_redirect(message, data, user_data = {})
        if Rails.env.production?
          if %w(inAppBrowser newWindow).include?(omniauth_window_type)
            render_data(message, user_data.merge(data))
          elsif auth_origin_url
            redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))
          else
            fallback_render data[:error] || 'An error occurred'
          end
        else
          # @resource.credentials = auth_hash["credentials"]

          # わかりやすい様に開発時はjsonとして結果を返す
          render json: @resource, status: :ok
        end
      end

      def clean_resource
        @resource.name = strip_emoji(@resource.name) unless @resource.name.nil?
        @resource.nickname = strip_emoji(@resource.nickname) unless @resource.nickname.nil?
      end

      def strip_emoji(str)
        str.encode('SJIS', 'UTF-8', invalid: :replace, undef: :replace, replace: '')&.encode('UTF-8')
      end

      private

      def get_redirect_route(devise_mapping)
        path = "#{Devise.mappings[devise_mapping.to_sym].fullpath}/#{params[:provider]}/callback"
        klass = request.scheme == 'https' ? URI::HTTPS : URI::HTTP
        klass.build(host: request.host, port: request.port, path: path).to_s
      end

      def getting_devise_mapping
        Rails.logger.info(request.env['omniauth.params']['resource_class'])
        [request.env['omniauth.params']['namespace_name'],
         request.env['omniauth.params']['resource_class'].underscore.tr('/', '_')].compact.join('_')
      rescue NoMethodError
        default_devise_mapping
      end

      def default_devise_mapping
        raise NotImplementedError, 'no default_devise_mapping set'
      end

      def authenticate_api_user!
        false
      end
    end
  end
end
