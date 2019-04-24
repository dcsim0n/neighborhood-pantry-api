class User < ApplicationRecord
    has_many :neighbors
    has_many :claims
    has_many :offers
    has_many :pantry_items
    has_many :pantry_requests
    has_many :neighborhoods, through: :neighbors
    has_one :address
    has_secure_password
    after_validation :geocode

    accepts_nested_attributes_for :address
    
    validates :first_name, :last_name, :password_digest, presence: true
    
    geocoded_by :formated_address
    reverse_geocoded_by :latitude, :longitude

    def formated_address
        [self.address.street, self.address.city, self.address.state, self.address.zip].join(', ')
    end
end
