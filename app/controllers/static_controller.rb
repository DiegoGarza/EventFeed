class StaticController < ApplicationController
  def home
    @posts = Post.all
    @topposts = Post.maximum("score")
  end

  def about
  end

  def contact
  end
end
