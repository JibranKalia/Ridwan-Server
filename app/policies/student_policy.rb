class StudentPolicy < ApplicationPolicy
  def create?
    if user.teacher?
      record.classrooms.map { |c| c.teacher.user_id }.include?(user.id)
    end
  end
end