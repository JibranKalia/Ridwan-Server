class ClassroomPolicy < ApplicationPolicy
  def create?
    record.user == user
  end

  def update?
    create?
  end

  def show?
    create?
  end

  def destroy?
    create?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.teacher?
        scope.where(user: user)
      end
    end
  end
end