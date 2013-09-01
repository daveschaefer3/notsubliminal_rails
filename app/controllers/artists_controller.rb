class ArtistsController < ApplicationController
  
  def new
    @artist = Artist.new
  end
  
end
