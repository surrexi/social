class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  validates :body, presence: true
  after_commit :send_notification, on: :create

  def send_notification
    CommentWorker.perform_async(id)
  end
end
