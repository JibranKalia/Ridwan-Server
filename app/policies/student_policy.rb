class StudentPolicy < ApplicationPolicy
  def create?
    record.classrooms.map(&:user_id).include?(user.id)
  end
end