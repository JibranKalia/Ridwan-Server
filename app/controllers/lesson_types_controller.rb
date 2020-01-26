class LessonTypesController < ApplicationController
  def index
    @lesson_types = policy_scope(LessonType)
    if params[:enrollment_id].present?
      enrollment = Enrollment.find(params[:enrollment_id])
      @lesson_types = @lesson_types.where(classroom: enrollment.classroom)
    end
    render json: @lesson_types
  end

  def update
    @lesson_type = LessonType.find(params[:id])
    authorize @lesson_type
    if @lesson_type.update(resource_params)
      render json: @lesson_type
    else
      render json: @lesson_type, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

  def permitted_attributes
    %i[name]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end