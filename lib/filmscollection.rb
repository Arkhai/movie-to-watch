require 'open-uri'
require 'nokogiri'

class FilmsCollection
  def self.from_url(url)
    films_collection = []

    html_doc = Nokogiri::HTML(URI.open(url))

    html_doc.css('.movieItem_info').each do |film|
      name = film.css('.movieItem_title').text
      genre = film.css('.movieItem_genres').text
      year = film.css('.movieItem_year').text.to_s

      films_collection << Film.new(name: name, genre: genre, year: year)
    end

    new(films_collection)
  end

  def initialize(films_collection = [])
    @films_collection = films_collection
  end

  def genres
    @films_collection.map(&:genre).uniq.sample(5)
  end

  def select_from_genres(choice)
    @films_collection.select { |film| film.genre == choice }.sample
  end
end
