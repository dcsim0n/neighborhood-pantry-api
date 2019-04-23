class Address < ApplicationRecord
    belongs_to :user

    def to_s
        [self.street, "#{self.city}, #{self.state}", self.zip].join("\n")
    end
end
