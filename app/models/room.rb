# frozen_string_literal: true
require 'securerandom'

class Room < ApplicationRecord
  belongs_to :user, foreign_key: :admin_user_id
  belongs_to :category, foreign_key: :category_id
  has_many :room_users
  has_many :users, through: :room_users
  before_save :set_uid

  def set_uid
    self.room_identity = uuid if self.room_identity.nil?
  end
  private
  def uuid
    # とりあえず、ランダムな文字列。ユーザーは実際にこれを打ち込むので、覚えやすいようにこういう風に分ける
    SecureRandom.hex(3) + '-' + SecureRandom.hex(3) + '-' + SecureRandom.hex(3)
  end
end
