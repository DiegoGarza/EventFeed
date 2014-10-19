class StaticController < ApplicationController
  def home
  	@event = Event.first
    @posts = @event.posts.order("created_at DESC")
    @topposts = @event.posts.limit(3).order("score DESC")
    @post = Post.new
    @user = current_user
  end

  def about
  end

  def contact
  end
end
