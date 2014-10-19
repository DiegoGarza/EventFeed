class StaticController < ApplicationController
  def home
    @location = lookup_ip_location.first
    @events = Event.near(@location.coordinates, 20)
    if Event.find_by_name(params[:name])
      @event = Event.find_by_name(params[:name])
      @posts = @event.posts.order("created_at DESC")
      @topposts = @event.posts.where("score > ?", 0).limit(3).order("score DESC")
    elsif !@events.empty?
      @events = @events.order('(select count(posts.id) from posts where posts.event_id = events.id)')
      @event = @events.first
      @posts = @event.posts.order("created_at DESC")
      @topposts = @event.posts.where("score > ?", 3).limit(3).order("score DESC")
    end
    @post = Post.new
    @user = current_user
  end

  def about
  end

  def contact
  end
end
