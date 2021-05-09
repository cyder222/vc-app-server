class SessionsController < ApplicationController
  def new
  end

  def create
    return Rails.logger.error("omaniauth.auth is empty") if request.env['omniauth.auth'].empty?
    user = User.from_omniauth(request.env["omniauth.auth"])
    return Rails.logger.error("invalid omniauth parameter#{request.env["omniauth.auth"]}") if user.nil?

    if user.save
      # header付きでroot_pathに飛ばす
      flash[:auth_token] = user.oauth_token
      flash[:refresh_token] = user.oauth_refresh_token
      flash[:uid] = user.uid
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    redirect_to root_path
  end
end