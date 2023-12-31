class Order < ApplicationRecord
    has_many :order_products
    belongs_to :user
    belongs_to :address
    #call_backs
    before_validation  :set_order_details
    after_create :generate_order_products
    after_create :send_confirmation

    validates_presence_of :user_id, :order_date, :order_number #:total_amount
    validates_numericality_of :user_id #:total_amount,greater_than:0

    def set_order_details
        self.order_number = "ybk#{Random.rand(100)}"
        self.order_date = Date.today
        #self.address_id = user_id
       # self.total_amount = 1
    end
     

    def generate_order_products
        cart_line_items = self.user.cart_line_items
        sum=0
        cart_line_items.each do |cart_line_item|
            order_product=OrderProduct.new
            order_product.order_id = self.id
            order_product.product_id = cart_line_item.product_id 
            order_product.quantity = cart_line_item.quantity
            order_product.price = cart_line_item.product.price
            order_product.total = order_product.price*order_product.quantity 
            order_product.save 
            sum+=order_product.total
        end

         CartLineItem.delete(self.user.cart_line_items.pluck(:id))
        self.update(total_amount: sum)
    end

def send_confirmation
#binding.pry
NotificationMailer.order_confirmation(self).deliver!
end



end

 