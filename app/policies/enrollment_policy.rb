class EnrollmentPolicy < ApplicationPolicy
  def show?
    record.classroom.user = user
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      []
    end
  end
end