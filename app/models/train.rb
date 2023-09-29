class Train < ApplicationRecord
    validates :ticket_price, :numericality => { :greater_than_or_equal_to => 0 },unless: -> { ticket_price.blank? }
    validates :train_capacity, :numericality => { :greater_than_or_equal_to => 0 },unless: -> { train_capacity.blank? }
    validates :seats_left, :numericality => { :greater_than_or_equal_to => 0 },unless: -> { seats_left.blank? }
    validates :train_number, presence: true
    validates :departure_station, presence: true
    validates :termination_station, presence: true
    validates :departure_time, presence: true
    validates :arrival_date, presence: true
    validates :arrival_time, presence: true
    validates :ticket_price, presence: true
    validates :train_capacity, presence: true
    validates :seats_left, presence: true


    belongs_to :admin
end
