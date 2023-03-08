# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.coustomer?
      can:read, :all

    elsif user.admin?
      can :manage, :all

    end
  end
end
