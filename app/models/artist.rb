class Artist < ApplicationRecord
  has_many :cards

  scope :by_artist_id, -> (id) {where("id = ?", id)}
end
