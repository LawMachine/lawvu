class Document < ActiveRecord::Base
	belongs_to :user
  belongs_to :matter

  mount_uploader :doc, DocumentUploader
  
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:doc),
      "url" => doc.url,
      "delete_url" =>  "/matters/#{matter_id}/documents/#{id}" ,
      "delete_type" => "DELETE"
    }
  end
end
