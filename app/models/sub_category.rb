class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
validates_presence_of :name
#validates_numericality_of :category_id
validates :name, uniqueness: {scope: :category_id}
end
