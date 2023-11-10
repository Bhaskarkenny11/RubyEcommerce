class Product < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category
  has_many :reviews
  has_many :cart_line_items
  has_many :order_products
  
    validates_presence_of :name, :descrption, :price, :stock, :category_id,:sub_category_id
    validates_numericality_of :stock, greater_than_or_equal_to: 0
    validates_uniqueness_of :name
    validates_length_of :descrption, minimum:10
    validates_numericality_of :category_id, greater_than:0
    validate :code 
    validates_numericality_of :price, greater_than: 10
    validate :own_validation


  def code
      if !self.price.nil?
            if self.price>50000 && self.code_eligibility
              self.errors.add(:code_eligibility,"code_eligibility is not available")
            end 
      end
  end  
   
  def own_validation
    if !self.category_id.nil?
        if (self.category_id == 1 ||self.category_id== 3 ) && self.code_eligibility
            self.errors.add(:code_eligibility,"COD  is not available for ids with category id 1 and 3")
        end
    end
end



end
