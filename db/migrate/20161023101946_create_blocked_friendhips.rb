class CreateBlockedFriendhips < ActiveRecord::Migration[5.0]
  def change
    create_table :blocked_friendhips do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end