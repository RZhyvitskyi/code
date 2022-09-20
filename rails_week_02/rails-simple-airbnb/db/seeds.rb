# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
Flat.destroy_all

puts 'Creating restaurants...'

flats = [
  { name: 'Dishoom', address: '7 Boundary St, London E2 7JE', description: "Some description", price_per_night: 100, number_of_guests: 10, picture_url: "https://picsum.photos/id/#{rand(1..100)}/1200" },
  { name: 'Pizza East', address: '56A Shoreditch High St, London E1 6PQ', description: "Some description", price_per_night: 120, number_of_guests: 3, picture_url: "https://picsum.photos/id/#{rand(1..100)}/1200" }
]

flats.each do |attributes|
  flat = Flat.create!(attributes)
  puts "Created #{flat.name}"
end

puts 'Finished!'