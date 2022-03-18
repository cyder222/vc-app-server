# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
    auth_key = ENV['google_oauth_key']
    auth_secret = ENV['google_oauth_secret']
    provider :google_oauth2, auth_key, auth_secret,
             name: :google_oauth2, scope: %w(profile),
             origin_param: 'return_to'
end
