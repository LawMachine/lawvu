class RegistrationsController < Devise::RegistrationsController
  layout :resolve_layout
  
  def edit1
    @user = current_user
    render :layout=>"application"
  end
  
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
end
