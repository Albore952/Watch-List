# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

# puts "creating movies..."
# 10.times do
# Movie.create(
#              title: Faker::Movie.title,
#             overview: Faker::Movie.quote,
#             poster_url: Faker::LoremFlickr.grayscale_image(size: "50x60"),
#             rating: rand(0..5)
# )
# end

# puts "movies created..."
# puts "#{Movie.count} movies created"

puts "creating movies..."

require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
top_movies = JSON.parse(URI.open(url).read)["results"]

top_movies.each do |top_movie|
  Movie.create!(
    title: top_movie["title"],
    overview: top_movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{top_movie["poster_path"]}",
    rating: top_movie["vote_average"])
end

puts "movies created..."
puts "#{Movie.count} movies created"
