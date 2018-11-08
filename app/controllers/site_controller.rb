class SiteController < ApplicationController
  def index
    # binding.pry
    @artists = Artist.all
    @cards = Card.all
  end

  def artist
  end

  def about
  end

  def gallery
  end

end
