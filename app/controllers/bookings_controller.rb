class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    # mes demandes de reservation auprès d'autres loueurs
  end

  def show
    set_booking
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_booking
  end

  def update
    set_booking
    @booking.update(booking_params)
    redirect_to  user_booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to user_bookings_path
  end

  private

  def set_booking
    @booking = booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :costume_id, :client_review, :client_rating, :costume_review, :client_rating)
  end
end
