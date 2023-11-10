class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin
  
  def index
    @categories=Category.all
    @sub_categories=SubCategory.all
    @products=Product.all
    @orders=Order.all
    @users=User.all
    @reviews=Review.all

  end

      def orders_reports


      end



end
