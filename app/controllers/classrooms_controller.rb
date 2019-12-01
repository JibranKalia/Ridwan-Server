class ClassroomsController < ApplicationController
  def index
    @classrooms = policy_scope(Classroom)
    render json: @classrooms
  end
end