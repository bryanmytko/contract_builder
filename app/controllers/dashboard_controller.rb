class DashboardController < ApplicationController
    
    def index
       session_check
       @title = 'Dashboard'
       @webready = Contract.find(:all, 
                        :conditions => { :contract_type => 'webready' })
       @professional = Contract.find(:all,
                        :conditions => { :contract_type => 'professional' })
    end
    
end
