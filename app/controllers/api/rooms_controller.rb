module Api
    class RoomsController < Api::BaseController
        def show
            id = parmas[:id]
            room = Room.find(id)
            render json: room, serializer: RoomSerializer
        end

        def index
            rooms = Room.all
            render json: rooms, each_serializer: RoomSerializer
        end
    end
end