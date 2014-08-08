class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :complete_profile
  
  def complete_profile
    if current_user.present? and !current_user.roleable_id.present?
      #redirect_to account_settings_path
    end
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def after_sign_in_path_for(resource)
    if user_signed_in?
      if resource.roleable_id.present?
        session[:return_to] || stored_location_for(resource) || root_url
      else
        account_settings_path
      end
    else    
      super
    end
  end
end
