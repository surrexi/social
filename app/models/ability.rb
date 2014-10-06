class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :manage, [Album, Photo], user: user
    can :manage, User, id: user.id
  end
end
