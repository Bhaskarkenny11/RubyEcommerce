class Address < ApplicationRecord

    belongs_to :user
    has_many :orders

    validates_presence_of :city,:street
    def full_address
        "#{self.street} - #{self.city}" 
    end


end
