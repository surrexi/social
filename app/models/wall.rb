class Wall < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :owner, class_name: 'User'
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
end
