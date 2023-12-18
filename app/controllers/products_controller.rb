class ProductsController < ApplicationController

  #filters
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_is_admin, except: [:index, :show]

  def index
    @products = Product.all
    @cart_line_item = CartLineItem.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.image_url.attach(params[:product][:image_url]) if params[:product][:image_url]
    #  binding.pry
    if @product.save
      redirect_to product_path(@product.id), notice: "successfully created #{@product.name}"
    else
      render action: "new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @cart_line_item = CartLineItem.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product.id), notice: "sucessfully updated #{@product.name}"
    else
      render action: "edit"
    end
  end

  def destroy
    # binding.pry
    @product = Product.find(params[:id])
    # binding.pry
    @product.destroy
    redirect_to products_path, notice: "successfuly destroyed #{@product.name}"
  end

  private

  def product_params
    params[:product].permit(:name, :descrption, :price, :category_id, :stock, :code_eligibility, :image_url, :sub_category_id)
  end
end
