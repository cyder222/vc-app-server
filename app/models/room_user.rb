# frozen_string_literal: true

class RoomUser < ApplicationRecord
  has_many :users
  has_many :rooms

  def join(room:, user:)
    room_user = RoomUser.find_by(room: room, user: user)
    return :already_exist unless room_user.nil?
    room_user = RoomUser.new(user: user, room: room)
    room_user.save!
  end
  def leave(room:, user:)
    room_user = RoomUser.find_by(room: room, user: user)
    return :not_exist if room_user.nil?
    room_user.destroy!
  end
end
