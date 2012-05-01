class ContractsController < ApplicationController

    def new
        @contract = Contract.new
        @contract.contract_type = params[:type]
    end

    def create
        @contract = Contract.new(params[:contract])
        if @contract.save
          redirect_to build_new_path(:id => @contract.id)
        elsif @contract.errors.any?
          render 'new' #reshow form with errors instead of carrying on to build page
        end
    end
    
    def edit
    	@contract = Contract.find(params[:id])
    end
    
    def update
    	@contract = Contract.find(params[:id])
    	@contract.update_attributes(params[:contract])
    	if @contract.errors.any?
    	  render 'edit'
    	end
    	if @contract.save
    		redirect_to root_url
    	end
    end
    
end
