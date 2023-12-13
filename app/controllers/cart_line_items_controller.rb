class CartLineItemsController < ApplicationController
    before_action :authenticate_user!
def index
@cart_line_items=current_user.cart_line_items
@order=Order.new
@sum_=0
@cart_line_items.each do |cart_line_item|
    @total =cart_line_item.product.price.to_i * cart_line_item.quantity
    @sum_ += @total.to_i
end
if @sum_ >1
    @razor_order=Razorpay::Order.create amount:@sum_*100, currency: 'INR', receipt: 'TEST'
    end
end

def checkout
    @cart_line_items=current_user.cart_line_items
    @order=Order.new
    @sum_=0
    @cart_line_items.each do |cart_line_item|
        @total =cart_line_item.product.price.to_i * cart_line_item.quantity
        @sum_ += @total.to_i
    end
    if @sum_ >1
        @razor_order=Razorpay::Order.create amount:@sum_*100, currency: 'INR', receipt: 'TEST'
        end
    end
    



def success
 @razor_details
 @razor_order
end

def show
   
    @cart_line_item = current_user.cart_line_items.find(params[:id])
end

def create
@cart_line_item=CartLineItem.new(cart_line_item_params)
@cart_line_item.user_id = current_user.id
    if @cart_line_item.save
        redirect_to cart_line_items_path, notice: "you have added product to the cart"
    end
end

def update
    @cart_line_item=CartLineItem.find(params[:id])
    @cart_line_item.update(cart_line_item_params)
    redirect_to cart_line_items_path,notice:"sucessfully updated"
end

def destroy
    @cart_line_item=CartLineItem.find(params[:id])
    @cart_line_item.destroy
    redirect_to cart_line_items_path, notice: "removed sucessfully"

end




private
def cart_line_item_params
params[:cart_line_item].permit(:product_id,:quantity)
end




end
