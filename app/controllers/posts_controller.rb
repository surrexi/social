class PostsController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.create(post_params.merge(sender: current_user))
    render @post
  end

  def destroy
    @post.destroy
    render json: { id: @post.id }
  end

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
