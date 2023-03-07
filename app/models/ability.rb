# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can:manage, :all

    elsif user.coustomer?
      can :read, :products
      can :manage, :orders
    end
  end
end
