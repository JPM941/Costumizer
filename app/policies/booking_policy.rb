class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    record.user == user
  end

  def index?
    record.user == user
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def accept?
    true
  end
  
  def close?
    true
  end
end
