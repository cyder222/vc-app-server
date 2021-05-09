# frozen_string_literal: true

class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table(:users) do |t|
      t.string :name
      t.string :nickname
      t.string :image
      t.string :email
      ## OAuth
      t.text :oauth_token
      t.text :oauth_refresh_token
      t.datetime :oauth_expires_at
      t.string :uid
      t.string :provider

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, %i[uid provider], unique: true
  end
end
