class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page]) if logged_in?
    #maybe use something similar to this to build a dashboard of other data
  end

  def about
  end

  def help
  end

  def contact
  end
  
end
