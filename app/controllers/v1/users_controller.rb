class V1::UsersController < ApplicationController
  # before_action :authenticate_v1_user!

  def show
    @user = User.find(params[:id])
    # authorize @user
    render json: @user
  end
end