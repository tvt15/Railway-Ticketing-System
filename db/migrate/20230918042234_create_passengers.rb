class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.string :address
      t.string :credit_card

      t.timestamps
    end
  end
end
