# Код, чтобы не заморачиваться с кодировкой Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/filmscollection'
require_relative 'lib/film'

films = FilmsCollection.from_url('https://www.kinoafisha.info/rating/movies/2021/')

puts 'Программа «Фильм на вечер»'
puts 'Фильм какого жанра вы хотите сегодня посмотреть?'

genres = films.genres
genres.each.with_index(1) { |genre, index| puts "#{index}. #{genre}" }

user_choice = STDIN.gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'

puts films.select_from_genres(genres[user_choice - 1])
