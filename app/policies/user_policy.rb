class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # export to tracker
  def dashboard?
    true
  end

  def tracker?
    true
  end

end
