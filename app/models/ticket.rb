class Ticket < ApplicationRecord
    belongs_to :admin
    belongs_to :train
end
