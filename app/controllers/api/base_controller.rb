# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    include CurrentUserByToken

    def require_api_user
      log_in
      @current_user = current_user
      render json: { error: 'did not login' }, status: 403 unless logged_in?
    end
  end
end
