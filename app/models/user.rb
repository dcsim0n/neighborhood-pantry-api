class User < ApplicationRecord
    has_many :neighbors
    has_many :neighborhoods, through: :neighbors
    has_one :address
    has_secure_password
    after_validation :geocode

    accepts_nested_attributes_for :address
    
    validates :first_name, :last_name, :password, presence: true
    
    geocoded_by :formated_address

    def formated_address
        [self.address.street, self.address.city, self.address.state, self.address.zip].join(', ')
    end
end
