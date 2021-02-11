class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.integer :max_user_num

      t.timestamps
    end
  end
end
