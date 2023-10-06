class Passenger < ApplicationRecord
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },unless: -> { email.blank? }
    validates :phone, format: { with: /\A\d{10}\z/, message: 'should be 10 digit' },unless: -> { phone.blank? }
    validates :credit_card, format: { with: /\A\d{16}\z/, message: 'should be 16 digit' },unless: -> { credit_card.blank? }
    validates :name, presence: true
    validates :password_digest, presence: true, allow_blank: true
    has_secure_password
    belongs_to :admin
    has_many :reviews
end
