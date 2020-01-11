# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = policy_scope(Student)
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    authorize @student
    render json: @student
  end

  def create
    @student = Student.new(resource_params)
    authorize @student
    if @student.save
      render json: @student
    else
      render json: @student, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  def destroy
    @student = Student.find(params[:id])
    authorize @student
    @student.destroy
    render json: @student
  end

  private

  def permitted_attributes
    %i[first_name last_name classrooms]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end
