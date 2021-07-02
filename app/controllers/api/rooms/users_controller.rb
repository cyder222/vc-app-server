module Api
  module Rooms
    class UsersController < Api::BaseController
      before_action :require_api_user, only: %i(create destroy)

      def index
        room_id = params[:room_id]
        room = Room.find_by(id: room_id)
        users = room.room_users.map { |room_user| room_user.user }
        render json: users, each_serializer: UserSerializer
      end

      def create
        room_id = params[:room_id]
        room = Room.find_by(id: room_id)
        RoomUser.join(room: room, user: current_user)
        render status: :ok, json: @controller.to_json
      end

      def destroy
        return render status: :bad_request, json: @controller.to_json if current_user.id.to_s != params[:id]

        user_id = params[:id]
        room_id = params[:room_id]
        room = Room.find_by(id: room_id)
        user = User.find_by(id: user_id)
        result = RoomUser.leave(room: room, user: user)
        render status: :ok, json: @controller.to_json
      end
    end
  end
end
