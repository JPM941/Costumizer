class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create]
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
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
