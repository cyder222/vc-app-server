# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules.
  devise  :rememberable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
