class MattersController < ApplicationController
  def new
    @current_page = "New Matter"
    @active_menu = "new_matter"
    @matter = Matter.new
    @document = Document.new
  end
  
  def create
    
    @current_page = "New Matter" 
    params[:matter][:user_id] = current_user.id
    if current_user.roleable_type == "Client"
      params[:matter][:lawyer_id] = User.find(params[:matter][:lawyer_id]).roleable_id
      params[:matter][:client_id] = current_user.roleable_id
      params[:matter][:status] = 0
      params[:matter][:pending_at] = "lawyer"
      @matter = Matter.new(client_matter_params)
    else
      params[:matter][:client_id] = User.find(params[:matter][:client_id]).roleable_id
      params[:matter][:lawyer_id] = current_user.roleable_id
      params[:matter][:status] = 0
      params[:matter][:pending_at] = "client"
      @matter = Matter.new(lawyer_matter_params)
    end
    if @matter.save
      redirect_to matter_path(@matter)
    else
      @active_menu = "new_matter"
      render "new"
    end
  end
  
  def index
  end
  
 
  def show
    @current_page = "Matter Details"
    @matter = Matter.find(params[:id])
    #raise @documents.inspect
  end
  
  def edit
    @current_page = "Edit Matter"
    @matter = Matter.find(params[:id])
  end
  
  def update
    @current_page = "Edit Matter"
    @matter = Matter.find(params[:id])
    if current_user.roleable_type == "Client"
      params[:matter][:lawyer_id] = User.find(params[:matter][:lawyer_id]).roleable_id
      params[:matter][:status] = 0
      params[:matter][:pending_at] = "lawyer"
      @matter.update_attributes(client_matter_params)
    else
      params[:matter][:client_id] = User.find(params[:matter][:client_id]).roleable_id
      params[:matter][:status] = 1
      params[:matter][:pending_at] = "client"
      @matter.update_attributes(lawyer_matter_params)
    end
    redirect_to matter_path(@matter)
  end
  
  def accept
    @matter = Matter.find(params[:id])
    @matter.update_attributes(:status=>2)
    redirect_to matter_path(@matter)
  end

  def summary
    @current_page = "Matter Summary"
    @matter_tasks = MatterTask.all
    @matter = Matter.find(params[:id])
    @documents = @matter.documents.limit(6)
    @lawyer = Lawyer.find(@matter.lawyer_id)
  end

  def matter_users
    
    @users = User.where("email LIKE ?", "%#{params[:q]}%")
    
    respond_to do |format|
      format.html{render :layout => false }
      format.json { render :json => @users.map(&:attributes), :layout => false }
    end
  end

  def matter_clients
    @clients = User.where("roleable_type = ? and email LIKE ? ", "Client","%#{params[:q]}%" )
    respond_to do |format|
      format.html{render :layout => false }
      format.json { render :json => @clients.map(&:attributes), :layout => false }
    end
  end

  def matter_lawyers
    @lawyers = User.where("roleable_type = ? and email LIKE ? ", "Lawyer","%#{params[:q]}%" )
    respond_to do |format|
      format.html{render :layout => false }
      format.json { render :json => @lawyers.map(&:attributes), :layout => false }
    end
    
  end
  
  private
  
  def client_matter_params
    params.require(:matter).permit(:lawyer_id, :issue, 
                                    :help_asked_by_client,
                                    :fee_arrangement_by_client,
                                    :budget,
                                    :client_reference,
                                    :timeframe,
                                    :client_id, :user_id, :status, :pending_at
                                    )
  end
  
  def lawyer_matter_params
    params.require(:matter).permit(:lawyer_id, :issue, 
                                    :help_given_by_lawyer,
                                    :fee_arrangement_by_lawyer,
                                    :fee_arrangement_suggestion,
                                    :fixed_fee_amount,
                                    :lawyer_reference,
                                    :expected_completion_date,
                                    :client_id, :user_id, :status, :pending_at, :case_type, :bill_frequency
                                    )
  end
end
