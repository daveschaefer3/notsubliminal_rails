class AlbumsController < ApplicationController

  def new
    @album = Album.new
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

    def album_params
      params.require(:album).permit(:name, :description)
    end

end
