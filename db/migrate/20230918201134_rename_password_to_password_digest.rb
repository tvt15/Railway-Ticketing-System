class RenamePasswordToPasswordDigest < ActiveRecord::Migration[7.0]
  def change
    rename_column :admins, :password, :password_digest
  end
end
