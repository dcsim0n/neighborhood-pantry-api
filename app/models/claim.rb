class Claim < ApplicationRecord
    belongs_to :user
    belongs_to :pantry_item
end
