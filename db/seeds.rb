# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.create(
  departure_date: '2021-02-13',
  time: '7.5',
  departure: 'Kraków',
  arrival: 'Puck',
  flight_length: 2.6,
  number_of_seats: 30
)
