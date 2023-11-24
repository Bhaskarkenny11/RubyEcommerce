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
        if @review.destroy
          redirect_to  review_path, notice: 'Review was successfully destroyed.'
        end
      end
      
    # def destroy
    #     @review.destroy
    #     respond_to do |format|
    #       format.html { redirect_to @product, notice: 'Review was successfully destroyed.' }
    #       format.json { head :no_content }
    #     end
    #   end


    private
    def review_params
            params[:review].permit(:title,:body,:rating,:product_id)
     end
end
