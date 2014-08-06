class DocumentsController < ApplicationController
  def index
    @matter = Matter.find(params[:matter_id])
    @document = Document.new
    @documents = Document.all

  end
  def create
    #raise params[:document][:doc].inspect
    #on Gallery using to_param with 'auth_tokens' for securing user interface
    @matter = Matter.find(params[:matter_id])
    #raise @matter.inspect
    @user = current_user
    #raise @user.inspect
    @document = Document.create(:matter_id => @matter.id, :user_id => @user.id, :doc => params[:document][:doc])
    #raise "bhimasen" 
    respond_to do |format|
      format.html { redirect_to :back, notice: "Thank you for uploading" }
      format.js
      format.json { render json: [@doc.to_jq_upload].to_json, status: :created, location: @doc }
    end
  end
  
  def new_version
     respond_to do |format|
      format.html
      format.js
    end
  end
end
