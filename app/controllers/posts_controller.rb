class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.score = 0
    event = Event.find(post_params[:event_id])
    if event.posts.count == 0
      UserMailer.event_start(event).deliver
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
