class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
validates_presence_of :name, :category_id
validates_numericality_of :category_id
validates_uniqueness_of :name
end
