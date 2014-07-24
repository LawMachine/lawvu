class RegistrationsController < Devise::RegistrationsController
  layout :resolve_layout
    
  private
  
  def sign_up_params
    params.require(:user).permit(:password, 
                                 :password_confirmation, :email, :roleable_id, :roleable_type
                                )
  end 
  
  def resolve_layout
    case action_name
    when "new", "create"
      "devise"
    else
      "application"
    end
  end 
  
  protected
  
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
  
end
