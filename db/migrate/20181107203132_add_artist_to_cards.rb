class AddArtistToCards < ActiveRecord::Migration[5.1]
  def change
    add_reference :cards, :artist, index:true, foreign_key: true
  end
end
