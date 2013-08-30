class StaticPagesController < ApplicationController
  def home
    @recentBlogposts = current_user.blogposts.first(3) if signed_in?
  end

  def about
  end

  def contact
  end

  def music
  end
end
