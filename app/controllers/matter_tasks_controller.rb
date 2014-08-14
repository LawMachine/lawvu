class MatterTasksController < ApplicationController
  
  
	
  def index
  end

  def create
    
    @new_matter_task = MatterTask.new
    @new_matter_task.assigned_to_user_id = params[:matter_task][:assigned_to_user_id]
    @new_matter_task.due_date = params[:matter_task][:due_date]
    @new_matter_task.task_fee_estimate = params[:matter_task][:task_fee_estimate]
    @new_matter_task.task_id = params[:task_id]
    @new_matter_task.matter_id = params[:matter_id]
    if @new_matter_task.save
       redirect_to :back
    else
     redirect_to :back   
    end 
    
  end

  

  def autocomplete_tag_name
  	
   	@users = User.where("email LIKE ?", "%#{params[:email]}%")
        
    respond_to do |format|
      format.html { render :layout => false }
    end
  end 
end
