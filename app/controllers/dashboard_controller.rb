class DashboardController < ApplicationController
    
    def index
       session_check
       @title = 'Dashboard'
    end
    
end
