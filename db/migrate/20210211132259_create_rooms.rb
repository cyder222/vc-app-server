# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :room_identity
      t.string :description
      t.integer :max_user_num
      t.string :main_language
      t.references :admin_user, foreign_key: { to_table: :users }
      t.references :category, foreign_key: {to_table: :categories}

      t.timestamps
    end
  end
end
