class ClassroomsController < ApplicationController
  def index
    @classrooms = policy_scope(Classroom)
    render json: @classrooms
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom
    render json: @classroom
  end
end