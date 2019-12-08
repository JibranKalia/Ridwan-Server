class ClassroomsController < ApplicationController
  def index
    @classrooms = policy_scope(Classroom)
    @classrooms.order(name: :desc)
    render json: @classrooms
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom
    render json: @classroom, include: [ :enrollments, :students ]
  end

  def create
    @classroom = Classroom.new(resource_params)
    authorize @classroom
    if @classroom.save
      render json: @classroom
    else
      render json: @classroom, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    authorize @classroom
    @classroom.destroy
    render json: @classroom
  end

  private

  def permitted_attributes
    %i[name user]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end
