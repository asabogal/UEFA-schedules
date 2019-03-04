class ReviewsController < ApplicationController

  def index
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
      if @review.save
        
        render json: @review, status: 201
      else
        flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @review.errors.full_messages.join("<br/>").html_safe
        render :index
      end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment, :reviewer)
  end

end
