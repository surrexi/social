class CommentsController < ApplicationController
  load_and_authorize_resource :photo
  load_and_authorize_resource :comment

  def create
    @comment = @photo.comments.create(comment_params.merge(user: current_user))
    render @photo.comments
  end

  def destroy
    @comment.destroy
    render json: { id: @comment.id, message: "Comment was deleted" }
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
