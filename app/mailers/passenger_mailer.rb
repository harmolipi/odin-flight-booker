class PassengerMailer < ApplicationMailer
  def thank_you_email(passenger = nil)
    @passenger = params.nil? ? passenger : params[:passenger]
    @booking = @passenger.booking
    @flight = @booking.flight
    mail(to: @passenger.email, subject: "Booking confirmed for flight: #{@flight.flight_number}")
  end
end
