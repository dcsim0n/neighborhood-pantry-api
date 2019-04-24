class Offer < ApplicationRecord
    belongs_to :user
    belongs_to :pantry_request
end
