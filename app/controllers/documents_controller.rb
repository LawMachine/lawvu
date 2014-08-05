class DocumentsController < ApplicationController
  def index
  end
  
  def create
  	@doc = Document.new(params[:doc])
  	respond_to do |format| 
  		if @doc.save
  			format.html { redirect_to @doc, notice: 'Document was successfully created.' } 
  			#format.json {
         #data = {id: @doc.id, thumb: view_context.image_tag(@doc.doc.url(:thumb))}
         #render json: data, status: :created, location: @doc
  			}
      else
        format.html { render action: "new" }
        #format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
  end
end
