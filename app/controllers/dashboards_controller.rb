class DashboardsController < ApplicationController
    
    def index
       @title = 'Dashboard'
       @webready = Contract.find_all_by_contract_type('webready')
       @professional = Contract.find_all_by_contract_type('professional')
       session_check('index')
    end
    
end
