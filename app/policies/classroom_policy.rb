class ClassroomPolicy < ApplicationPolicy
  def index?
    record.user == user
  end

  def create?
    index?
  end

  def update?
    index?
  end

  def show?
    index?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.teacher?
        scope.where(user: user)
      end
    end
  end
end