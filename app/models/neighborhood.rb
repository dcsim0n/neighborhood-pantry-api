class Neighborhood < ApplicationRecord
    has_many :neighbors
    has_many :users, through: :neighbors

    reverse_geocoded_by :latitude, :longitude
end
