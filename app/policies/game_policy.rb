class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
  	true
  end
  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
  end
end
