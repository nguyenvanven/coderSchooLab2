class RenameColumnReadAdd < ActiveRecord::Migration[5.0]
  def change
  	rename_column :messages, :read_add, :read_at
  end
end
