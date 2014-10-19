class StaticController < ApplicationController
  def home
    @location = lookup_ip_location.first
    if !@location
      redirect_to action: 'about'
    @events = Event.near(@location.coordinates, 20)
    @event = @events.first
    @posts = @event.posts.order("created_at DESC")
    @topposts = @event.posts.where("score > ?", 3).limit(3).order("score DESC")
    @post = Post.new
    @user = current_user
  end

  def about
  end

  def contact
  end
end
