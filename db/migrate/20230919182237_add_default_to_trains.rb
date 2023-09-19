class AddDefaultToTrains < ActiveRecord::Migration[7.0]
  def change
    change_column_default :trains, :admin_id, from: nil, to: 1
  end
end
