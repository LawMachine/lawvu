class MattersController < ApplicationController
  def new
    @matter = Matter.new
  end
  
  def create
    params[:matter][:user_id] = current_user.id
    if current_user.roleable_type == "Client"
      params[:matter][:client_id] = current_user.roleable_id
      params[:matter][:status] = 0
      params[:matter][:pending_at] = "lawyer"
      @matter = Matter.new(client_matter_params)
    else
      params[:matter][:lawyer_id] = current_user.roleable_id
      params[:matter][:status] = 0
      params[:matter][:pending_at] = "client"
      @matter = Matter.new(lawyer_matter_params)
    end
    if @matter.save
      redirect_to matter_path(@matter)
    else
      render "new"
    end
  end
  
  def index
  end
  
  def show
    @matter = Matter.find(params[:id])
  end
  
  def edit
    @matter = Matter.find(params[:id])
  end
  
  def update
    @matter = Matter.find(params[:id])
    if current_user.roleable_type == "Client"
      params[:matter][:status] = 0
      params[:matter][:pending_at] = "lawyer"
      @matter.update_attributes(client_matter_params)
    else
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
