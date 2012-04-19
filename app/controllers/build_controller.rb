class BuildController < ApplicationController

	def edit
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(@contract.id)
		render "professional"
	end
	
	def new
		@contract = Contract.find(params[:id])
		@build = Build.create(:contract_id => params[:id])
		render "professional"
	end
	
	def hourly
		@test = params[:hourly_rate]
		@build = Build.find_by_contract_id(params[:id])
		@build.update_attributes(:hourly_rate => params[:hourly_rate])
		@contract = Contract.find(params[:id])
		#abort('Build::hourly')
		render "professional"
	end
		
	
end
