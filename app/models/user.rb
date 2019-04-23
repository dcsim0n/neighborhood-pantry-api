class User < ApplicationRecord
    has_secure_password
    has_many :neighbors
    has_many :neighborhoods, through: :neighbors
    has_one :address
    accepts_nested_attributes_for :address
end
