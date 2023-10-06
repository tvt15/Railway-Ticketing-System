# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create!(username: "Admin", name: "NewAdmin",email: "admin@admin.com", password_digest: BCrypt::Password.create('123456'), phone:1234567890, address:"Raleigh, NC", credit_number:1234567890123456)
Passenger.create!(name: "Admin", email: "a1@a1.com", password_digest: BCrypt::Password.create('123456'), phone:1234567891, address:"Raleigh, NC", credit_card:1234567823123456)
