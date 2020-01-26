# frozen_string_literal: true

class LessonItemsController < ApplicationController
  def create
    @lesson_item = LessonItem.new(resource_params)
    authorize @lesson_item
    if @lesson_item.save
      render json: @lesson_item
    else
      render json: @lesson_item, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  def update
    @lesson_item = LessonItem.find(params[:id])
    authorize @lesson_item
    if @lesson_item.update(resource_params)
      render json: @lesson_item
    else
      render json: @lesson_item, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

  def permitted_attributes
    %i[lesson lesson_type from_surah from_ayah to_surah to_ayah quality_one quality_two rating]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end
