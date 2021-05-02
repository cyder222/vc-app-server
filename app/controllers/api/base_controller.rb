# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken

    def require_sign_in
      render json: { error: 'did not login'}, status: 400 unless user_signed_in?
    end
  end
end
