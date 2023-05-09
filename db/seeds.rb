# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.delete_all
Airport.delete_all
letters = 'ABCDEFGHIJKLMNOPQRSTUVWXY'.chars
code = []
100.times { code << letters.sample(3).join }
airports = []
code.map { |k| airports << Airport.create(code: k) }
100.times { Flight.create(departure_airport: airports.sample, arrival_airport: airports.sample, start: rand(10.days).seconds.from_now) }
