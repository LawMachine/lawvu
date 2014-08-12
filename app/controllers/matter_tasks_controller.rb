class MatterTasksController < ApplicationController
  def index
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
   	users = User.select([:email]).where("email LIKE ?", "%#{params[:email]}%")
    result = users.collect do |t|
      { user_email: t.email }
    end
    render json: result
  end 
end
