class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    begin
      first_name = params.require(:first_name)
      last_name = params.require(:last_name)
      email = params.require(:email)
      password = params.require(:password)
      password_confirmation = params.require(:password_confirmation)

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

      render json: @user
    rescue ActionController::ParameterMissing => e
      render status: :bad_request
    rescue ActiveRecord::RecordInvalid => e
      render json: @user, status: :unprocessable_entity, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end

  end

  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user, include: [:teacher]
  end
end