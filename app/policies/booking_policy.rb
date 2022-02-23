class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all

      # For a multi-tenant SaaS app, you may want to use:
      scope.all
    end
  end

  def create?
    true
  end
end
