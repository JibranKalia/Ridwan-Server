# frozen_string_literal: true

class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(resource_params)
    authorize @teacher
    if @teacher.save
      render json: @teacher
    else
      render json: @teacher, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end
  
  def show
    @teacher = Teacher.find(params[:id])
    authorize @teacher
    render json: @teacher
  end

  private

  def permitted_attributes
    %i[user]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end
