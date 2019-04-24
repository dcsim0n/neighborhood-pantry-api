class PantryRequest < ApplicationRecord
    belongs_to :user
    has_many :offers
end
