class ReviewsController < ApplicationController
  before_action :set_costume, only: %i[new create]
  def new
    @costume = Costume.find(params[:costume_id])
    authorize @costume
    @review = Review.new
    authorize @review
  end
  def create
    @review = Review.new(review_params)
    authorize @review
    @review.costume = @costume
    @review.save
    redirect_to dashboard_path(@costume)
  end

  private

  def set_costume
    @costume = Costume.find(params[:costume_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
