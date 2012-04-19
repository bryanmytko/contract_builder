class ContractsController < ApplicationController

    def professional
       @contract = Contract.new
       @type = request.path
       render :action => 'new.html.erb'
    end
    
    def webready
        @contract = Contract.new
        @type = request.path
        render :action => 'new.html.erb'
    end

    def create
        @contract = Contract.new(params[:contract])
        if @contract.save
            redirect_to dashboard_path
        else
            abort("didn't save")
        end
    end

end
