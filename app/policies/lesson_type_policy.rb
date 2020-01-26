class LessonTypePolicy < ApplicationPolicy
  def update?
    record.classroom.teacher.user == user
  end
end