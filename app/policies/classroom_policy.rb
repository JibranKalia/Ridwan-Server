
class ClassroomPolicy < ApplicationPolicy
  def create?
    user.teacher?
  end

  def update?
    create?
  end
end