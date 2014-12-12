class User < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :senders, class_name: 'Post', foreign_key: 'sender_id'
  has_many :identities, dependent: :destroy

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  acts_as_voter

  def self.find_for_oauth(auth)
    identity = Identity.find_for_oauth(auth)
    user = identity.user || User.where(email: auth.info.email).first
    unless user
      user = User.create!(
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    identity.update(user: user)
    user
  end

  def user_name
    login || email
  end
end
