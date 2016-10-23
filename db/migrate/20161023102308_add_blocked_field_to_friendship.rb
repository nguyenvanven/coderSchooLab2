class AddBlockedFieldToFriendship < ActiveRecord::Migration[5.0]
  def change
  	add_column :friendships, :is_blocked, :boolean
  end
end
