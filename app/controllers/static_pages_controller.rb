class StaticPagesController < ApplicationController
  def home
    @blogpost = current_user.blogposts.build if signed_in?
  end

  def about
  end

  def contact
  end

  def music
  end
end
