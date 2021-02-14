class RoomSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :main_language, :created_at, :updated_at
end
