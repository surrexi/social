class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, _model) { controller.current_user }

  belongs_to :user
  belongs_to :photo
  belongs_to :wall
  validates :body, presence: true
  after_commit :send_notification, on: :create

  def send_notification
    CommentWorker.perform_async(id)
  end
end
