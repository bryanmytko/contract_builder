class BuildController < ApplicationController

	def edit
		@contract = Contract.find(params[:id])
		@build = Build.find_all_by_contract_id(@contract.id)
		@designs = ProfessionalTemplate.find(1)
		render "professional"
	end
	
	def new
		@contract = Contract.find(params[:id])
		@build = Build.create(:contract_id => params[:id])
		@designs = ProfessionalTemplate.find_all_by_page_type('design')
		render "professional"
	end
	
	def hourly
		@test = params[:hourly_rate]
		@build = Build.find_all_by_contract_id(params[:id])
		@build.update_attributes(:hourly_rate => params[:hourly_rate])
		@contract = Contract.find(params[:id])
		render "professional"
	end
		
	
end
