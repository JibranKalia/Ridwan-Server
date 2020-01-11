# frozen_string_literal: true

class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    first_name = params.require(:first_name)
    last_name = params.require(:last_name)
    email = params.require(:email)
    password = params.require(:password)
    password_confirmation = params.require(:password_confirmation)

    ActiveRecord::Base.transaction do
      @user = User.new(
        email: email,
        password: password,
        password_confirmation: password_confirmation
      )
      @user.save!

      @teacher = Teacher.new(
        first_name: first_name,
        last_name: last_name,
        user: @user
      )
      @teacher.save!
    end
    render json: @user
  rescue ActionController::ParameterMissing => e
    payload = { field_name: e.param, message: "#{e.param.to_s.titlecase} is required." }
    render status: :bad_request, json: { errors: [payload] }
  rescue ActiveRecord::RecordInvalid => e
    payload = e.record.errors.messages.map { |key, val| { field_name: key, message: val.first } }
    render status: :bad_request, json: { errors: payload }
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user, include: [:teacher]
  end
end
