class Admin < ApplicationRecord
    has_secure_password
    has_many :passengers
    has_many :trains
    has_many :tickets
    has_many :review
    validates :username, presence: true
    validates :password_digest, presence: true, allow_blank: true
    validates :address, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },unless: -> { email.blank? }
    validates :phone, format: { with: /\A\d{10}\z/, message: 'should be 10 digit' },unless: -> { phone.blank? }
    validates :credit_number, format: { with: /\A\d{16}\z/, message: 'should be 16 digit' },unless: -> { credit_number.blank? }
    validates :name, presence: true

end
