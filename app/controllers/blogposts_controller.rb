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

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

    def blogpost_params
      params.require(:blogpost).permit(:content, :title)
    end
end