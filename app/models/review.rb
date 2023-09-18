class Review < ApplicationRecord
    belongs_to :admin
    belongs_to :passenger
    belongs_to :train
end
