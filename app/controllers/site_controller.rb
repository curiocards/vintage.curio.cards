class SiteController < ApplicationController

  before_action :set_artist, only: [:artist]

  def index
    @artists = Artist.all
    @cards = Card.all
    # binding.pry
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
    end

end