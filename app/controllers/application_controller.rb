# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in?
    render json: { message: 'not login'}, status: 404 unless user_signed_in?
  end
end
