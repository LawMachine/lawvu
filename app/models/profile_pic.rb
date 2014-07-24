class ProfilePic < ActiveRecord::Base
  belongs_to :user
  
  mount_uploader :name, ProfilePicUploader
end
