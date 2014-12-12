class Photo < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, _model) { controller.current_user }

  acts_as_votable

  belongs_to :user
  belongs_to :album
  has_many :comments, as: :commentable, dependent: :destroy

  mount_uploader :image, PhotoUploader
end
