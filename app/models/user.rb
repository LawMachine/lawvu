class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :roleable, polymorphic: true
  has_one :profile_pic
  has_many :matters
  has_many :documents
  
  # acts_as_liker
  # acts_as_likeable
end
