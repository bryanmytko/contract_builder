class DashboardsController < ApplicationController
    
    def index
       session_check
       @title = 'Dashboard'
       @webready = Contract.find_all_by_contract_type('webready')
       @professional = Contract.find_all_by_contract_type('professional')
    end
    
end
