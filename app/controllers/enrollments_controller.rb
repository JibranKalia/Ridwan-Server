class EnrollmentsController < ApplicationController
  def index
    @enrollments = policy_scope(Enrollment)
    render json: @enrollments
  end

  def show
    @enrollment = Enrollment.find(params[:id])
    authorize @enrollment
    render json: @enrollment
  end

  def create
    @enrollment = Enrollment.new(resource_params)
    authorize @enrollment
    if @enrollment.save
      render json: @enrollment
    else
      render json: @enrollment, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    authorize @enrollment
    @enrollment.destroy
    render json: @enrollment
  end

  private

  def permitted_attributes
    %i[name user]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end
