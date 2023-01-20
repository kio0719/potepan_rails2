class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :authenticate_user!,if: :use_auth?

  def after_sign_in_path_for(resource) 
    users_profile_path
  end

  def after_sign_out_path_for(resource)
    root_path 
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name]) 
  end

  def use_auth?
    unless controller_name == 'home' && action_name = 'index'
      true
    end
  end
end
