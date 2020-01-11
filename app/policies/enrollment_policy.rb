# frozen_string_literal: true

class EnrollmentPolicy < ApplicationPolicy
  def show?
    record.classroom.teacher.user = user
  end

  def destroy?
    show?
  end
end
