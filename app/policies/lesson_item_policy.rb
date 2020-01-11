# frozen_string_literal: true

class LessonItemPolicy < ApplicationPolicy
  def create?
    record.lesson.enrollment.classroom.teacher.user == user
  end

  def show?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
