class ReviewsController < ApplicationController

  def index
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
      if @review.save
        
      else

      end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment, :reviewer)
  end

end
