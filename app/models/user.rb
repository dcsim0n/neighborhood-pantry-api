class User < ApplicationRecord
    has_many :neighbors, dependent: :destroy
    has_many :claims, dependent: :destroy
    has_many :offers, dependent: :destroy
    has_many :pantry_items, dependent: :destroy
    has_many :pantry_requests, dependent: :destroy
    has_many :neighborhoods, through: :neighbors
    has_one :address, dependent: :destroy
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
