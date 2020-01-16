# frozen_string_literal: true

class TeacherPolicy < ApplicationPolicy
  def create?
    record.user == user
  end
end
