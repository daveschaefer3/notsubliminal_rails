class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Song added!"
      redirect_to root_url
    else
      render 'songs/new'
    end
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
    @songs = Song.paginate(page: params[:page])
  end

  def destroy
  end

  private

    def song_params
      params.require(:song).permit(:title)
    end
end
