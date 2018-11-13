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
      # Returns the artist model object by there username
      @artist = Artist.find_by_username(params[:username])

      # Custom scope from card.rb takes the artist username, finds artist id, finds all cards associated with it
      # List of cards is then grouped by publish_date, and sorted
      @grouped_cards = Card.by_artist_username(params[:username]).group_by{|card| card.publish_date}.sort 

      # binding.pry
    end

end