class StaticController < ApplicationController
  def home
    @location = request.location
  	@event = Event.first
    @posts = @event.posts
    @topposts = @event.posts.limit(3).order("score DESC")
  end

  def about
  end

  def contact
  end
end
