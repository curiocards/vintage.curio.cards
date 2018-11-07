class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :username
      t.string :name
      t.string :avatar_filename
      t.text :bio
      t.string :bio_video
      t.string :twitter_username
      t.string :url_1

      t.timestamps
    end
  end
end
