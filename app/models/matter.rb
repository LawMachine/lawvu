class Matter < ActiveRecord::Base
  belongs_to :lawyer
  belongs_to :client
  belongs_to :user
  has_many :documents
end
