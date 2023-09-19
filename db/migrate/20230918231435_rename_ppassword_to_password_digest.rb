class RenamePpasswordToPasswordDigest < ActiveRecord::Migration[7.0]
  def change
    rename_column :passengers, :password, :password_digest
  end
end
