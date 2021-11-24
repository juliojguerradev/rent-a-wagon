class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @user = current_user
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])

    @booking = Booking.new(booking_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :vehicle)
  end
end
