class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, _model) { controller.current_user }, recipient: :commentable

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true
  after_commit :send_notification, on: :create

  def send_notification
    CommentWorker.perform_async(id)
  end
end
