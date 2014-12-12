class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy
end
