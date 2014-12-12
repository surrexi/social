class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.create(comment_params.merge(user: current_user))
    render @comment
  end

  def destroy
    @comment.destroy
    render json: { id: @comment.id, message: "Comment was deleted" }
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
