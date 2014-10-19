class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.score = 0
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private

    def post_params
      params.require(:post).permit(:comment, :event_id, :user_id)
    end
end
