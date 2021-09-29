# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all
Flight.destroy_all

DURATIONS = {
  SFO: {
    JFK: 20_580
  },
  JFK: {
    SFO: 17_640
  }
}.freeze

Airport.create([{ code: 'SFO' }, { code: 'NYC' }])

20.times do
  departure = Airport.all.sample
  arrival = departure == Airport.first ? Airport.last : Airport.first
  Flight.create(
    from_airport: departure,
    to_airport: arrival,
    duration: DURATIONS.dig(departure, arrival),
    departure: DateTime.now + rand(7)
  )
end
