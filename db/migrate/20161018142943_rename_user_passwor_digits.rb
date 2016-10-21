class RenameUserPassworDigits < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password_digits,:password_digest
  end
end
