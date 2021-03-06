class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :vote, :all
    can :manage, Post, sender: user
    can :manage, [Album, Photo, Comment], user: user
    can :manage, User, id: user.id
  end
end
