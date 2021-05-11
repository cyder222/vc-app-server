class RoomSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :main_language, :room_identity, :created_at, :updated_at
end
