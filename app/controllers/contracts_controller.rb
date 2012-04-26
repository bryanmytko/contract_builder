class ContractsController < ApplicationController

    def new
        @contract = Contract.new
        @type = params[:type]
    end

    def create
        @contract = Contract.new(params[:contract])
        if @contract.save
            redirect_to build_new_path(:id => @contract.id)
        else
            abort("didn't save")
        end
    end
    
    def edit
    	@contract = Contract.find(params[:id])
    end
    
    def update
    	@contract = Contract.find(params[:id])
    	@contract.update_attributes(params[:contract])
    	if @contract.save
    		redirect_to root_url
    	end
    end
    
end
