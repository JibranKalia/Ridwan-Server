class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end

  def user_not_authorized(exception)
    self.status        = 401
    self.content_type  = 'application/json'
    self.response_body = { errors: [{ status: '401', detail: exception.message }]}.to_json
  end
end
