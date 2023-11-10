class CartLineItemsController < ApplicationController
    before_action :authenticate_user!
def index
@cart_line_items=current_user.cart_line_items
@order=Order.new
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
