class V1::UsersController < ApplicationController
  # before_action :authenticate_v1_user!

  def show
    @user = User.find(params[:id])
    # authorize @user
    respond_with :v1, @user
  end
end