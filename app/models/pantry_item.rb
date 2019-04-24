class PantryItem < ApplicationRecord
    belongs_to :user
    has_many :claims
end
