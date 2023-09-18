class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.string :address
      t.string :credit_number

      t.timestamps
    end
  end
end
