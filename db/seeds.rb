require 'json'
require 'open-uri'
require_relative '../app/models/movie'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)['results']
movies.each { |movie| Movie.create(title: movie['original_title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}", rating: movie['vote_average']) }
