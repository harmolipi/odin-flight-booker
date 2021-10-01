class PassengersController < ApplicationController
  def create
    @passenger = Passenger.new(passenger_params)
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end
end
