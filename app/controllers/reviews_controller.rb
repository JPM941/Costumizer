class ReviewsController < ApplicationController
  before_action :set_costume, only: %i[new create]
  def new
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    authorize @booking
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
