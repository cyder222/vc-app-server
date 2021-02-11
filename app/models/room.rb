class Room < ApplicationRecord
    belongs_to :admin_user_id, class_name: "User"
    belongs_to :caetegory
end
