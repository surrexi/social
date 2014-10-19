class CommentMailer < ActionMailer::Base
  default from: "from@social.com"

  def add_comment(id)
    @comment = Comment.find(id)
    @user = @comment.photo.user
    @url  = album_photo_url(@comment.photo.album, @comment.photo)
    mail(to: @user.email)
  end
end
