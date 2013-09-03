class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
  end

  def index
  end

  def destroy
  end

  private

    def song_params
      params.require(:song).permit(:title)
    end
end
