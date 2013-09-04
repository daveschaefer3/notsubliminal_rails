class AlbumsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

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
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:success] = "Album updated!"
      redirect_to @album
    else
      render 'edit'
    end
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
