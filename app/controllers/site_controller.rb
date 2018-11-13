class SiteController < ApplicationController

  before_action :set_artist, only: [:artist]

  def index
    @artists = Artist.all # passed for the artist-list partial
    # latest = [28,29,30] # set the cards under the featured section
    # @feat = Card.by_card_id_array(latest) # Custom scope from card.rb
    @last = Card.last(3) # another way to get the most recent. faster
    # binding.pry    
    # @cards = Card.all
  end

  def artist
  end

  def about
  end

  def gallery
  end

  private
    def set_artist
      @artist = Artist.find_by_username(params[:username])
      @cards = Card.by_artist_username(params[:username]) # custom scope from card.rb
      # binding.pry
    end

end