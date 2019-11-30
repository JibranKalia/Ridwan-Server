class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  after_action :verify_authorized, unless: :devise_controller?
end
