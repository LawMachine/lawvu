class ProfilesController < ApplicationController
  skip_before_action :complete_profile, :only=>[:edit,:update]
  
  def edit
    @profile = current_user.roleable
    if !@profile.present?
      @profile = current_user.roleable_type.constantize.new
    end
    render "#{current_user.roleable_type.downcase}"
  end
  
  def update
    @profile = current_user.roleable
    
    if @profile.present?
      @profile.update_attributes(send("#{current_user.roleable_type.downcase}_params".to_sym))
    else
      @profile = current_user.roleable_type.constantize.new(send("#{current_user.roleable_type.downcase}_params".to_sym))
      if @profile.save
        user = current_user
        user.roleable_id = @profile.id
        user.save
      end
    end
    render "#{current_user.roleable_type.downcase}"
  end
  
  def search_clients
    @users = Array.new
    @users = User.joins("JOIN clients ON clients.id = users.roleable_id and users.roleable_type = 'Lawyer' and (users.email like '#{params[:q]}%' or clients.first_name like '#{params[:q]}%')").select("clients.id, CONCAT(clients.first_name,' ',clients.last_name,' (',users.email,')') as email_with_name")
    respond_to do |format|
     format.html
     format.json { render :json => @users.uniq.map(&:attributes)}
    end
  end
  
  def search_lawyers
    @users = Array.new
    @users = User.joins("JOIN lawyers ON lawyers.id = users.roleable_id and users.roleable_type = 'Lawyer' and (users.email like '#{params[:q]}%' or lawyers.first_name like '#{params[:q]}%')").select("lawyers.id, CONCAT(lawyers.first_name,' ',lawyers.last_name,' (',users.email,')') as email_with_name")
    respond_to do |format|
     format.html
     format.json { render :json => @users.uniq.map(&:attributes)}
    end
  end
  
  def change_image
    @profile = current_user.profile
  end
  
  def upload_profile_pic
    user = current_user.profile_pic
    if user.present?
      user.name = params[:user_profile][:profile_pic]
      user.save
    else
      user_pic = ProfilePic.new
      user_pic.user_id = current_user.id
      user_pic.name = params[:user_profile][:profile_pic]
      user_pic.save
    end
    redirect_to root_url
  end
  
  private
  
  def client_params
    params.require(:client).permit(:first_name, :last_name, 
                                    :company_name,
                                    :mobile_no, 
                                    :imageable=>[:id, :name]
                                    )
  end
  
  def lawyer_params
    params.require(:lawyer).permit(:first_name, :last_name, 
                                    :company_name,
                                    :mobile_no, 
                                    :imageable=>[:id, :name]
                                    )
  end
end
