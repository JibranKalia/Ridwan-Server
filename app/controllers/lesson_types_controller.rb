class LessonTypesController < ApplicationController
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