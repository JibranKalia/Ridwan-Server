class LessonPolicy < ApplicationPolicy
  def create?
    record.enrollment.classroom.teacher.user == user
  end
end