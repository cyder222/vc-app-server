# frozen_string_literal: true

module Api
  # controller of the category
  class UsersController < Api::BaseController
    before_action :require_api_user, only: [:current]
    def current
      user = @current_user
      render json: user, serializer: UserSerializer
    end

    def show
      user_id = params[:id]
      user = User.find_by(id: user_id)
      render json: user, serializer: UserSerializer
    end
  end
end
