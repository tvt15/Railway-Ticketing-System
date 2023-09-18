class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :train_number
      t.string :departure_station
      t.string :termination_station
      t.date :departure_date
      t.time :departure_time
      t.date :arrival_date
      t.time :arrival_time
      t.decimal :ticket_price
      t.integer :train_capacity
      t.integer :seats_left

      t.timestamps
    end
  end
end
