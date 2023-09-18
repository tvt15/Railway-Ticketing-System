class AddKeysToTrains < ActiveRecord::Migration[7.0]
  def change
    add_reference :trains, :admin, null: false, foreign_key: true
  end
end
