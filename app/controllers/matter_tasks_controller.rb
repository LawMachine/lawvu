class MatterTasksController < ApplicationController
  
  
	
  def index
  end

  def create
  	#raise params.inspect
  end

  def autocomplete
     @users = User.order(:email).where("email ILIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { 
        render json: @users.map(&:email)
      }
    end
  end

  def autocomplete_tag_name
  	#users = User.order([:email]).where("email LIKE ?", "%#{params[:email]}%")
  	#raise params.inspect
   	@users = User.where("email LIKE ?", "%#{params[:email]}%")
        
    respond_to do |format|
      format.html { render :layout => false }
    end
  end 
end
