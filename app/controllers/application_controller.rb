class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :authenticate_user!

  def after_sign_in_path_for(resource) 
    users_profile_path
  end

  def after_sign_out_path_for(resource)
    root_path 
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:icon,:introduction])
  end

end
