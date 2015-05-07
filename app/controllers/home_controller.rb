class HomeController < ApplicationController
  def home
      if logged_in?
      @post  = current_user.posts.build
      
      @feed_items = current_user.feed.paginate(page: params[:page])
      @comment = Comment.new
  end
  end

  def about
  end
  def privacy
  end
  def terms
  end
  def rooms
  end
end
