class DocumentsController < ApplicationController
  before_filter :get_matter
  
  def index
    @current_page = "Matter Documents"
    @document = Document.new
    @documents = @matter.documents.where("latest_version = true").order("created_at desc")
  end

  def create
    @document = @matter.documents.new
    @document.user_id = current_user.id
    @document.doc = params[:document][:doc].shift
    if @document.save
      respond_to do |format|
        format.html {                                         #(html response is for browsers using iframe sollution)
          render :json => [@document.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@document.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
  
  def new_version
    # raise params.inspect
    # Parameters: {"matter_id"=>"1", "id"=>"7"}
    @doc = Document.where(:matter_id => params[:matter_id], :id => params[:id]).first
    @new_doc = @matter.documents.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def previous_versions
    @doc = Document.where(:matter_id => params[:matter_id], :id => params[:id]).first
    if @doc.parent_doc_id.present?

       @document_versions = Document.where("parent_doc_id = ? or id = ?",@doc.parent_doc_id, @doc.parent_doc_id ).order("version desc")
       
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def delete_version
     if @document = Document.find(params[:id])
        if @document.latest_version == true and @document.parent_doc_id.present?
          @prev_versions = Document.where("id <> ? and (parent_doc_id = ? or id = ?)",@document.id, @document.parent_doc_id, @document.parent_doc_id ).order("version desc")
          @prev_version = @prev_versions.first
          if @prev_version.present?
            @prev_version.update_attributes(:latest_version=>true)
          end
          if @prev_versions.count == 1
            @prev_version.update_attributes(:parent_doc_id=>nil)            
          end
        end

        if @document.parent_doc_id.nil?
          @prev_versions = Document.where("id <> ? and (parent_doc_id = ? or id = ?)",@document.id, @document.id, @document.id ).order("version asc")
          @new_parent = @prev_versions.first
          @prev_versions.update_all(:parent_doc_id=>@new_parent.id)
          @new_parent.update_attributes(:parent_doc_id=>nil) 
        end

        @document.destroy
     end
     respond_to do |format| 
        # format.html { redirect_to matter_documents_path(:matter_id => params[:matter_id])  } 
        format.html { redirect_to :back  }
      end 
  end

  def upload_version
    @user = current_user
    @parent_doc = Document.find(params[:id])
    @parent_doc.inspect
    parent_doc_id = (@parent_doc.parent_doc_id.present?) ? @parent_doc.parent_doc_id : @parent_doc.id
    @document = Document.new(:matter_id => @matter.id, :user_id => @user.id, :doc => params[:document][:doc], :version => params[:new_version], :parent_doc_id => parent_doc_id)
    if @document.save
      @parent_doc.update_attributes(:latest_version => false)
      respond_to do |format|
        format.html { redirect_to :back, notice: "Thank you for uploading" }
        format.js
        format.json { render json: [@doc.to_jq_upload].to_json, status: :created, location: @doc }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: "Thank you for uploading" }
        format.js
        format.json { render json: [@doc.error].to_json, status: :created, location: @doc }
      end
    end
  end

  def download
    if @document = Document.find(params[:id])
      send_file @document.doc.path #, :type=>"application/zip" 
    end
    
  end
  
  def destroy
    
    if @document = Document.find(params[:id])
      if @document.parent_doc_id.present?
        @parent_doc = Document.find(@document.parent_doc_id)
        @parent_docs = Document.where(:parent_doc_id => @document.parent_doc_id )
        @parent_docs.destroy_all if @parent_docs.present?
        @parent_doc.destroy
      else
        @document.destroy
      end
      respond_to do |format| 
        format.html { redirect_to matter_documents_path(:matter_id => params[:matter_id])  } 
      end 
    else



    end 
  end

  private

  def get_matter
    @matter = Matter.find(params[:matter_id])
  end
end
