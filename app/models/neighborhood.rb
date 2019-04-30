class Neighborhood < ApplicationRecord
    has_many :neighbors, dependent: :destroy
    has_many :users, through: :neighbors
    has_many :pantry_requests, through: :users
    has_many :pantry_items, through: :users
    reverse_geocoded_by :latitude, :longitude
end
