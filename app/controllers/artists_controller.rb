class ArtistsController < ApplicationController
  
  def new
    @artist = Artist.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

    def artist_params
      params.require(:artist).permit(:name, 
        :description, 
        :email, 
        :extlink)
    end
  
end
