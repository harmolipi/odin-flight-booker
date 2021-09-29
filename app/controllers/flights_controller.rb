
class FlightsController < ApplicationController
  def index
    if invalid_date?
      redirect_to root_path, alert: 'Invalid search! Please try again.'
      return
    end

    @flight = Flight.new
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    if params[:flight]
      @params = flight_params
      beginning_date = Date.parse(flight_params[:departure]).beginning_of_day
      end_date = Date.parse(flight_params[:departure]).end_of_day
      @flights = Flight.where(
        from_airport: flight_params[:from_airport_id],
        to_airport: flight_params[:to_airport_id],
        departure: (beginning_date)..(end_date)
      ).order(:departure)
      @passengers = params[:passengers]
    else
      @params = {}
      @flights = {}
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:from_airport, :from_airport_id, :to_airport_id, :departure)
  end

  def invalid_date?
    params[:flight] && !params[:flight][:departure].present?
  end
end
