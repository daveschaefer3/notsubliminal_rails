class BlogpostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = current_user.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "Blogpost created!"
      redirect_to root_url
    else
      render 'blogposts/new'
    end
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(blogpost_params)
      flash[:success] = "Post updated."
      redirect_to @blogpost
    else
      render 'edit'
    end
  end

  def index
    @blogposts = Blogpost.paginate(page: params[:page])
  end

  def destroy
  end

  private

    def blogpost_params
      params.require(:blogpost).permit(:content, :title, :published)
    end

    def publish_at
      # if published changes from false to true then timestamp published_at
    end
end