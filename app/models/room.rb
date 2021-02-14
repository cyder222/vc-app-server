class Room < ApplicationRecord
    belongs_to :user, foreign_key: :admin_user_id
    belongs_to :category, foreign_key: :category_id
end
