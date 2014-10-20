class Photo < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, _model) { controller.current_user }

  belongs_to :user
  belongs_to :album
  has_many :comments, dependent: :destroy

  mount_uploader :image, PhotoUploader
end
