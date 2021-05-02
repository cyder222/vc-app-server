# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #
  # before action :require_sign_in only[:create]
  def require_sign_in
    render json: { error: 'did not login'}, status: 400 unless user_signed_in?
  end
end
