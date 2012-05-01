class Contract < ActiveRecord::Base
  
  attr_accessible :company, :address, :name, :phone, :url, :email, :contract_type
  
  validates :company, :address, :name, :phone, :url, :email, :presence => true
  
end
