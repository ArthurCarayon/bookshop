class BookPolicy < ApplicationPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @record = book
  end

  def index?
    user.admin? || book.exists?(id: user.id)
  end

  def show?
    user.admin? || book.id == user.id
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