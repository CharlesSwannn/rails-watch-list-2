require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

puts "Deleting previous seeds..."
puts "---------------------------"
Movie.destroy_all


user["results"].each do |result|
  name = result["original_title"]
  overview = result["overview"]
  rating = result["vote_average"]
  file_path = "https://image.tmdb.org/t/p/w500#{result["poster_path"]}"
  movie = Movie.create(name: name, overview: overview, poster_url: file_path, rating: rating)
  puts "Movie with title #{movie.name} was created in you db!"
  puts "---------------------------"
end

puts "Finished seeding!"
puts "---------------------------"
