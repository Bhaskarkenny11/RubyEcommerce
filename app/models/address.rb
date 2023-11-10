class Address < ApplicationRecord

    belongs_to :user
    has_many :orders

    def full_address
        "#{self.street} - #{self.city}" 
    end


end
