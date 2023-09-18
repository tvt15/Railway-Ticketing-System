class AddKeysToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_reference :passengers, :admin, null: true, foreign_key: true
  end
end
