class ArtistsController < ApplicationController
  
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "Artist added!"
      redirect_to root_url
    else
      render 'artists/new'
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
  end

  def index
    @artists = Artist.paginate(page: params[:page])
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
