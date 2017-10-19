class ReviewsController < ApplicationController
  def create
    @review = Review.new(params_review)
    @review.update(user_id: current_user.id) unless current_user.nil?
    redirect_back(fallback_location: root_path)
  end

  private

  def params_review
    params.require(:review).permit(:book_id, :comment)
  end
end
