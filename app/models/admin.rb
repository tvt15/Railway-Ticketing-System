class Admin < ApplicationRecord
    has_secure_password
    has_many :passengers
    has_many :trains
    has_many :tickets
    has_many :reviews
    validates :email, presence: true, uniqueness: true
end
