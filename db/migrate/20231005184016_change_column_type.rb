class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :booked_by, :string
  end
end
