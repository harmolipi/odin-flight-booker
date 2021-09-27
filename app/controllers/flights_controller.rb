class FlightsController < ApplicationController
  def index
    @params = params[:flight] ? params[:flight] : {}
    @flights = params[:flight] ? Flight.where(from_airport: flight_params[:from_airport], to_airport: flight_params[:to_airport], departure_date: flight_params[:departure_date]).order(:departure_date, :departure_time) : Flight.all.order(:departure_date, :departure_time)
    # binding.pry
    @flight = Flight.new
    @airports = Airport.all
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
  end

  private

  def flight_params
    params.require(:flight).permit(:from_airport, :to_airport, :departure_date)
  end
end
