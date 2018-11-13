class Card < ApplicationRecord

  # some of these might need to be called with .sort

  # examples
  # scope :latest_since_25, -> {where("id > ?", 25)}
  # scope :artist_id_4, -> {where(artist_id: 4 )}
  scope :by_artist_id, -> (id) {where("artist_id = ?", id)}
  scope :by_card_id, -> (id) {where("id = ?", id)}
  # scope :by_card_id_array, -> (id_array) {where(id: id_array)} # example: [21,22,23]. note: not escaped.
  scope :by_card_id_array, -> (id_array) {where("id IN (?)", id_array)} # example: [21,22,23]. escaped version. "" contains sql
  scope :by_artist_username, -> (username) {where("artist_id = ?", Artist.where(username: username).pluck(:id)[0])} # redo in pure sql?. needs .sort for phneep

  # binding.pry
end
