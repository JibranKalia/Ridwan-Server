
class V1::UserPolicy < ApplicationPolicy
  def show?
    @user == @record
  end
end