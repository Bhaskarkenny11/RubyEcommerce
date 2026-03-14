class Category < ApplicationRecord
  validates_presence_of :name
    validates_uniqueness_of :name
    has_many :products
    has_many :sub_categories,dependent: :destroy
     #validates :names, presence:true, uniqueness:true
     accepts_nested_attributes_for :sub_categories
    def formatted_name
    "#{self.id} - #{self.name}"
     end
end
 