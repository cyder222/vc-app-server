# frozen_string_literal: true

class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def self.join(room:, user:)
    room_user = RoomUser.find_by(room_id: room.id, user_id: user.id)
    return :already_exist unless room_user.nil?
    room_user = RoomUser.new
    room_user.user = user
    room_user.room = room
    room_user.save!
  end
  def self.leave(room:, user:)
    room_user = RoomUser.find_by(room_id: room.id, user_id: user.id)
    return :not_exist if room_user.nil?
    room_user.destroy!
  end
end
