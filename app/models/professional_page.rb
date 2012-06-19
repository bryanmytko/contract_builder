class ProfessionalPage < ActiveRecord::Base
  validates_presence_of :name, :presence => true
 # validates_presence_of :hours, :presence => true, :only_integer => true, :message => 'Integers only.'
# # validates_presence_of :cost, :presence => true, :only_integer => true, :message => 'Integers only.'
 # validates_presence_of :description, :presence => true
end
