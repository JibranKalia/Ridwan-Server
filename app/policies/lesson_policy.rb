class LessonPolicy < ApplicationPolicy
  def create?
    record.enrollment.classroom.teacher.user == user
  end

  def show?
    create?
  end
end