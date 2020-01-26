class LessonTypePolicy < ApplicationPolicy
  def update?
    record.classroom.teacher.user == user
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(classroom: user.teacher.classrooms)
    end
  end
end