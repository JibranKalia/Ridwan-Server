class EnrollmentPolicy < ApplicationPolicy
  def show?
    record.classroom.user = user
  end

  def destroy?
    show?
  end
end