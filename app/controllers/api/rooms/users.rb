module Api
    class RoomsController < Api::BaseController
      before_action :require_api_user, only: [:create, :destory]

      def index
        room_id = params[:room_id]
        room = Room.find_by(id: room_id)
        render json: room.in_users, each_serializer: UserSerializer
      end
  
      def create
        room_id = params[:id]
        room = Room.find_by(id: room_id)
        RoomUser.join(room: room, user: current_user)     
      end
  
      def destroy
        room_id = params[:id]
        room = Room.find_by(id: room_id)
        RoomUser.leave(room: room, user: current_user)
      end
    end
  end
  