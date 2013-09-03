class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "Album added!"
      redirect_to root_url
    else
      render 'albums/new'
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
  end

  def index
    @albums = Album.paginate(page: params[:page])
  end

  def destroy
  end

  private

    def album_params
      params.require(:album).permit(:name, :description)
    end

end
