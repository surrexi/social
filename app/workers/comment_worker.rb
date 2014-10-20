class CommentWorker
  include Sidekiq::Worker

  def perform(id_comment)
    CommentMailer.add_comment(id_comment).deliver
  end
end
