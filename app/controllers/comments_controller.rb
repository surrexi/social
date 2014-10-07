class CommentsController < ApplicationController
  load_and_authorize_resource :photo
  load_and_authorize_resource :comment, through: :photo

  def create
    @comment = @photo.comments.create(comment_params.merge(user: current_user))
    redirect_to [@photo.album, @photo]
  end

  def destroy
    @comment.destroy
    redirect_to [@photo.album, @photo]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
