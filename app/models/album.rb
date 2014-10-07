class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :title, presence: true
end
