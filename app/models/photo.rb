class Photo < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, _model) { controller.current_user }

  acts_as_votable

  belongs_to :user
  belongs_to :album
  belongs_to :wall
  has_many :comments, dependent: :destroy

  mount_uploader :image, PhotoUploader
end
