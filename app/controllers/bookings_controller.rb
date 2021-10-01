class BookingsController < ApplicationController
  def new
    @booking = Flight.find(params[:flight_id]).bookings.new
    params[:passenger_count].to_i.times { @booking.passengers.new }
    # @booking.passengers.build
    # binding.pry
  end

  def create
    @booking = Booking.new(booking_params)
    
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.fetch(:booking, {}).permit(:flight_id, :passenger_count, passengers_attributes: [:name, :email])
  end
end
