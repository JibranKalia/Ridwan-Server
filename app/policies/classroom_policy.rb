class ClassroomPolicy < ApplicationPolicy
  def index?
    user.teacher?
  end

  def create?
    index?
  end

  def update?
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