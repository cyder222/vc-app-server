module Api
  class RoomsController < Api::BaseController
    before_action :require_api_user, only: [:create]

    def show
      room_identity_or_id = params[:id]
      room = room_identity_or_id =~ /^[0-9]+$/ ? Room.find_by(id: room_identity_or_id) : Room.find_by(room_identity: room_identity_or_id)
      render json: room, serializer: RoomSerializer
    end

    def index
      rooms = Room.all
      render json: rooms, each_serializer: RoomSerializer
    end

    def create
      return render json: { error: 'category not found' }, status: 400 if Category.find(room_params[:category_id]).nil?

      room = Room.new(room_params.merge(admin_user_id: current_user.id))
      room.save!
      render json: room, serializer: RoomSerializer
    end

    private

    def room_params
      params.permit(:title, :description, :max_user_num, :main_language, :category_id)
    end

    def room_admin?
      room_id = params[:id]
      room = Room.find_by(id: room_id)
      room.admin_user_id == current_user.id
    end
  end
end
