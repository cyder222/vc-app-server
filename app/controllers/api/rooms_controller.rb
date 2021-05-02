module Api
  class RoomsController < Api::BaseController
    before_action :require_sign_in, only: [:create]

    def show
      id = params[:id]
      room = Room.find(id)
      render json: room, serializer: RoomSerializer
    end

    def index
      rooms = Room.all
      render json: rooms, each_serializer: RoomSerializer
    end

    def create
      return render json: { error: 'category not found'}, status: 400 if Category.find(room_params[:category_id]).nil?
      return render json: { error: 'not current user'}, status: :unauthorized if current_user.id.nil?
      room = Room.new(room_params.merge(admin_user_id: current_user.id))
      room.save!
      render json: room, serializer: RoomSerializer
    end

    private
    def room_params
      params.permit(:title, :description, :max_user_num, :main_language, :category_id)
    end
  end
end
