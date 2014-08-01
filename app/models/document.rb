class Document < ActiveRecord::Base
	belongs_to :user
  belongs_to :matter

  has_attached_file :doc#, :styles => { full: '2048x2048>',:medium => "300x300>", :thumb => "100x100>" } 
end
