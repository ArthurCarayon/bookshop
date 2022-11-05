class BookPolicy < ApplicationPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @record = book
  end

  def index?
    # user.admin? || record.exists?(user_id: user.id)
  end

  def show?
    # user.admin? || record.user_id == user.id
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    # user.admin? || record.user_id == user.id
  end

  def destroy?
    true
  end

  class Scope
    def resolve
      scope.all
    end
  end
end