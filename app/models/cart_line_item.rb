class CartLineItem < ApplicationRecord
  

belongs_to :user
belongs_to :product


  validates_presence_of :product_id, :user_id,:quantity  
  validates_numericality_of :product_id,:user_id, greater_than: 0
  validates_numericality_of :quantity, within: 1..5
end
