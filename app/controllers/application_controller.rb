class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  protect_from_forgery

  after_action :verify_authorized
end
