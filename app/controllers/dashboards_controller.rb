class DashboardsController < ApplicationController
    
    def index
       @title = 'Dashboard'
    
       if(Contract.find_by_id(session[:user_id]))
         @professional = Contract.find(:all, 
                                     :conditions => ["contract_type = ? and user_owner = ?",
                                                     'professional', session[:user_id].to_s])
        end
        session_check('index')
    end
    
end
