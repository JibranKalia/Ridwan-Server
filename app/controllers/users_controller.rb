# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user, include: [:user]
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(resource_params)
      render json: @user
    else
      render json: @user, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # def create
  #   first_name = params.require(:first_name)
  #   last_name = params.require(:last_name)
  #   email = params.require(:email)
  #   password = params.require(:password)
  #   password_confirmation = params.require(:password_confirmation)

  #   ActiveRecord::Base.transaction do
  #     @user = User.new(
  #       email: email,
  #       password: password,
  #       password_confirmation: password_confirmation
  #     )
  #     @user.save!

  #     @user = user.new(
  #       first_name: first_name,
  #       last_name: last_name,
  #       user: @user
  #     )
  #     @user.save!
  #   end
  #   render json: @user
  # rescue ActionController::ParameterMissing => e
  #   payload = { field_name: e.param, message: "#{e.param.to_s.titlecase} is required." }
  #   render status: :bad_request, json: { errors: [payload] }
  # rescue ActiveRecord::RecordInvalid => e
  #   payload = e.record.errors.messages.map { |key, val| { field_name: key, message: val.first } }
  #   render status: :bad_request, json: { errors: payload }
  # end

  private

  def permitted_attributes
    %i[role first_name last_name]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: permitted_attributes)
  end
end
