class AddBookedbyToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :booked_by, :integer
  end
end
