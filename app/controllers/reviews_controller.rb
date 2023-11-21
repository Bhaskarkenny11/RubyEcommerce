class ReviewsController < ApplicationController
    
    before_action :authenticate_user!
    
    def create
        @review = Review.new(review_params)
         @review.user_id = current_user.id
        if @review.save
            redirect_to root_path, notice: "thankyou for the review"
        end
    end
        def show
            @reviews=Review.all
        end
    
    # def destroy
    #     @product=product.find(params[:product_id])
    #     @review=@product.reviews.find(params[:id])
    #     @review.destroy
    #     redirect_to root_path, notice: 'Review was successfully destroyed.'
    #  end
    def destroy
        @review = Review.find(params[:id])
        binding.pry
        if @review.destroy
          redirect_to root_path, notice: 'Review was successfully destroyed.'
        end
      end



    private
    def review_params
            params[:review].permit(:title,:body,:rating,:product_id)
     end
end
