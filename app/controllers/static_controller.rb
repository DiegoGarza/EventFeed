class StaticController < ApplicationController
  def home
    @location = lookup_ip_location.first

    @events = Event.near(@location.coordinates, 20)
    @event = @events.first
    @posts = @event.posts
    @topposts = @event.posts.limit(3).order("score DESC")
  end

  def about
  end

  def contact
  end
end
