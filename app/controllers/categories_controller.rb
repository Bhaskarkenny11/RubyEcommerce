class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
   before_action :check_is_admin,  except: [:index,:show]

    def index 
      @categories = Category.all
    end

  def new
    @category = Category.new
  end
  # ______________________________
    def create
     @category=Category.new(params[:category].permit(:name))
      #binding.pry
        if @category.save
         redirect_to categories_path, notice:"successfuly created #{@category.name} "
         else
         render action: "new"
        end
    end
  # ___________________________________
    def show
      @category=Category.find(params[:id]) 
        @products = Product.where('category_id = ?', @category.id) 
      # @products=Product.where('category_id=?',@category.id).length

    end

 def edit
  @category= Category.find(params[:id])
 end
#  binding.pry
  def update
  @category= Category.find(params[:id]) 
    if @category.update(params[:category].permit(:name))
    # binding.pry
    redirect_to category_path(@category.id), notice:"successfuly updated #{@category.name} "
    else
      render action:"edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice:"successfuly destroyed"
  end 

end
 