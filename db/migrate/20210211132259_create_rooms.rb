class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :room_identity
      t.string :description
      t.integer :max_user_num
      t.string :main_language

      t.timestamps
    end
    add_foreign_key :rooms, :users, column: :admin_usesr_id
    add_foreign_key :rooms, :categories, column: :category_id
  end
end
