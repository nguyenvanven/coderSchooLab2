class RenameIsReadMesage < ActiveRecord::Migration[5.0]
  def change
  	rename_column :messages, :isRead, :is_read
  end
end
