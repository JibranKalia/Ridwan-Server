# frozen_string_literal: true

class ClassroomPolicy < ApplicationPolicy
  def create?
    record.teacher.user == user
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
      scope.where(teacher: user.teacher) if user.teacher?
    end
  end
end
