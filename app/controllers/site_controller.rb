class SiteController < ApplicationController

  before_action :set_artist, only: [:artist]
  before_action :all_artists, only: [:index] # for the artist-list partial
  before_action :last_cards, only: [:index] # for the featured cards section

  def index
  end
  def artist
  end
  def about
  end
  def gallery
  end

  private
    def all_artists
      @artists = Artist.all
    end

    def last_cards
      # latest = [28,29,30] # set the cards under the featured section
      # @feat = Card.by_card_id_array(latest) # Custom scope from card.rb
      @last = Card.last(3) # another way to get the most recent. faster  
    end

    def set_artist
      # Returns the artist model object by there username
      @artist = Artist.find_by_username(params[:username])

      # Custom scope from card.rb takes the artist username, finds artist id, finds all cards associated with it
      # List of cards is then grouped by publish_date, and sorted
      @grouped_cards = Card.by_artist_username(params[:username]).group_by{|card| card.publish_date}.sort 
      # binding.pry
    end

end