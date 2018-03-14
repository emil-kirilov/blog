class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      # admin
      if user.admin?
        can :manage,               User
        cannot [:update, :delete], User, creator_id: nil
        can [:update, :delete],    User, id: user.id
      end

      # reseller
      can :manage, User, creator_id: user.id

      # user
      can [:read, :update], User, id: user.id
    end
  end
end
