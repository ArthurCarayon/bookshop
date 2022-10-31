class UserPolicy < ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      !user.basic? 
    end
  
    def show?
      !user.basic? || record.id == user.id
    end
  
    def create?
      !user.basic? || record.id == user.id
    end
  
    def update?
      !user.basic? || record.id == user.id
    end
  
    def destroy?
      !user.basic? || record.id == user.id
    end
  
  end