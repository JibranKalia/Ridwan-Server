
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(current_user, record)
    @current_user = current_user
    @user = record
  end

  def show?
    @current_user == @user
  end
end