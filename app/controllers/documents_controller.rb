class DocumentsController < ApplicationController
  before_filter :get_matter
  
  def index
    @document = Document.new
    @documents = Document.where("latest_version = true").order("created_at desc")

  end
  def create
    @document = @matter.documents.new
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
     respond_to do |format|
      format.html
      format.js
    end
  end
  private

  def get_matter
    @matter = Matter.find(params[:matter_id])
  end
end
