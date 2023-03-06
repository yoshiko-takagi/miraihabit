class UserChallengePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def update?
    user == record.user
  end

  def create?
    true
  end

  def tracker?
    true
  end

end
