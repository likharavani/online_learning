class ApplicationController < ActionController::Base
  layout "welcome"
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name])
  end
  def after_sign_in_path_for(resource)
    #  home_index_path
   users_url
  end

end
