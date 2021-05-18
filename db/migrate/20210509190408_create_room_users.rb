class CreateRoomUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :room_users do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :room, foreign_key: {to_table: :rooms}
      t.timestamps
    end
  end
end
