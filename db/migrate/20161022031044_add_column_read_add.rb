class AddColumnReadAdd < ActiveRecord::Migration[5.0]
  def change
  	add_column :messages, :read_add, :datetime
  end
end
