class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    #binding.pry
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.address_id = params[:order][:address]
    # @order.order_date=Date.today
    # @order.total_amount=1             #before_validation method in model
    # @order.order_number="ybk#{Random.rand(100)}"
    #binding.pry
    if @order.save
      redirect_to order_path(@order.id), notice: "your order has been created"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
    @user = current_user
    @orders = current_user.orders.where("strftime('%m', created_at) = ?", params[:month].to_i.to_s)
  end

  private

  def order_params
    #params[:order].permit()
  end
end
