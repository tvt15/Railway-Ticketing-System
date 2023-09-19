class Passenger < ApplicationRecord
    has_secure_password
    belongs_to :admin
    has_many :reviews
end
