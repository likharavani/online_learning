class ApiController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:avatar])
  end

  def current_user
    token = request.headers['Authorization']&.split(' ')&.last
    return unless token
    decoded = AuthenticationService.decode_token(token)
    @current_user = User.find(decoded['user_id'])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    nil
  end

  def authenticate_request
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end
end
