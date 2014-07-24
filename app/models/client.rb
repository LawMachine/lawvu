class Client < ActiveRecord::Base
  validates_presence_of :first_name, :company_name, :mobile_no
  has_one :user, as: :roleable
  has_many :matters
  
  def full_name
    full_name = self.first_name
    full_name = full_name + " " + self.last_name if self.last_name.present?
  end
end
