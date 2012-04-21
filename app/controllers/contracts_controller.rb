class ContractsController < ApplicationController

    def professional
       @contract = Contract.new
       @type = request.path
    end
    
    def webready
        @contract = Contract.new
        @type = request.path
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
    
    def build
    		abort(:id)
    		#render @contract.contract_type + '_build'
    end

end
