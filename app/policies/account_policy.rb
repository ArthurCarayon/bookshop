class AccountPolicy < ApplicationPolicy
  attr_reader :user, :user

  def initialize(user, category)
    @user = user
    @category = category
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope
    def resolve
      scope.all
    end
  end
end
