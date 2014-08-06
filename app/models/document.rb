class Document < ActiveRecord::Base
	belongs_to :user
  belongs_to :matter

  mount_uploader :doc, DocumentUploader
end
