class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can :read, User
      can :update, User, :id => user.id
      can :read, Order
      can :create, Order, :user_id => user.id
      can :destroy, Order, :user_id => user.id
      can :manage, Product
    else
      can :read, User
      can :create, User
    end
  end
end
