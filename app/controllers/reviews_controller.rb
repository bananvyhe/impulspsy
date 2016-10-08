class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
    else
      render action: 'new'
    end
  end

  private 
    def review_params
      params.require(:review).permit(:author, :text)
    end
end
