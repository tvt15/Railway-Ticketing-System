class AddKeysToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :passenger, null: false, foreign_key: true
    add_reference :tickets, :train, null: false, foreign_key: true
    add_reference :tickets, :admin, null: false, foreign_key: true
  end
end
