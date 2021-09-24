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

current_time = Time.now
Airport.create([{ code: 'SFO' }, { code: 'NYC' }])
Flight.create(from_airport: Airport.first, to_airport: Airport.last, duration: DURATIONS[:SFO][:JFK], departure: current_time)
Flight.create(from_airport: Airport.last, to_airport: Airport.first, duration: DURATIONS[:JFK][:SFO], departure: current_time + 7.days)
