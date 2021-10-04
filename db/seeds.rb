# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all
Flight.destroy_all
Passenger.destroy_all
Booking.destroy_all

DURATIONS = {
  SFO: {
    JFK: 20_580
  },
  JFK: {
    SFO: 17_640
  }
}.freeze

def create_random_flight(departure_airport, arrival_airport, day)
  flight_letter = [*'A'..'Z'].sample
  flight_digits = Array.new(4) { [*'0'..'9'].sample }.join
  flight_number = flight_letter + flight_digits

  departure = DateTime.now + day.days + rand((DateTime.now + day.days).end_of_day - (DateTime.now + day.days))
  
  Flight.create(
    from_airport: departure_airport,
    to_airport: arrival_airport,
    duration: DURATIONS.dig(departure_airport.code.to_sym, arrival_airport.code.to_sym),
    departure: departure,
    flight_number: flight_number
  )
end

Airport.create([{ code: 'SFO' }, { code: 'JFK' }])

31.times do |day|
  rand(2..4).times do
    create_random_flight(Airport.first, Airport.last, day)
    create_random_flight(Airport.last, Airport.first, day)
  end
end


