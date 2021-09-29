class FlightsController < ApplicationController
  def index
    if params[:flight]
      @params = params[:flight]
      beginning_date = Date.parse(flight_params[:departure]).beginning_of_day
      end_date = Date.parse(flight_params[:departure]).end_of_day
      @flights = Flight.where(
        from_airport: flight_params[:from_airport],
        to_airport: flight_params[:to_airport],
        departure: (beginning_date)..(end_date)
      ).order(:departure)
      @passengers = params[:passengers]
    else
      @params = {}
      @flights = {}
    end
    @flight = Flight.new
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
  end

  private

  def flight_params
    params.require(:flight).permit(:from_airport, :to_airport, :departure, :passengers)
  end
end
