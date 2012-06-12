class DashboardsController < ApplicationController
    
    def index
       @title = 'Dashboard'
       @webready = Contract.find(:all, 
                                 :conditions => ["contract_type = ? and user_owner = ?",
                                                 'webready', session[:user_id]])
       @professional = Contract.find(:all, 
                                     :conditions => ["contract_type = ? and user_owner = ?",
                                                     'professional', session[:user_id]])
        session_check('index')
    end
    
end
