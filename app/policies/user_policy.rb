class UserPolicy < ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      user.admin? || record.exists?(id: user.id)
    end
  
    def show?
      user.admin? || record.id == user.id
    end
  
    def create?
      user.admin? || record.id == user.id
    end
  
    def update?
      user.admin? || record.id == user.id
    end
  
    def destroy?
      user.admin? || record.id == user.id
    end
  
  end