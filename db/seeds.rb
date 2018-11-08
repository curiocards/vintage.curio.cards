# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
# require 'pry'

cards_array = CSV.read(Rails.root.join('scratch/card_info.csv'))
artists_array = CSV.read(Rails.root.join('scratch/artist_info.csv'))
cards, artists = [], []

# Create array of hashes with the header as the keys
cards_array.drop(1).each_with_index do |card, i| # Skip headers, loop cards
   cards[i] = cards_array[0].zip(card).to_h # header.zip(values), convert to hash
end
artists_array.drop(1).each_with_index do |artist, i| # Skip headers, loop artists
  artists[i] = artists_array[0].zip(artist).to_h # header.zip(values), convert to hash
end

# Import the hashes into the db as records
artists.each do |artist|
  if Artist.find_by(id: artist["id"]).nil?
    #true, it doesnt exist. add.
    Artist.create(artist)
    puts "Added Record: #{artist['username']}"
  else
    puts "Skipped Record: #{artist['username']}"
    #false, it exists already. skip.
  end
end
cards.each do |card|
  if Card.find_by(id: card["id"]).nil?
    #true, it doesnt exist. add.
    Card.create(card)
    puts "Added Record: #{card['card_name']}"
  else
    #false, it exists already. skip.
    puts "Skipped Record: #{card['card_name']}"
  end
end