class Category < ApplicationRecord
  validates_presence_of :name
    validates_uniqueness_of :name
    has_many :products
    has_many :sub_categories
     #validates :names, presence:true, uniqueness:true
    def formatted_name
    "#{self.id} - #{self.name}"
     end
end
 