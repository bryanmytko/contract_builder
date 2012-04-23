class BuildController < ApplicationController

	def edit
		@contract = Contract.find(params[:id])
		@build = Build.find_all_by_contract_id(@contract.id)
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		render "professional"
	end
	
	def new
		@contract = Contract.find(params[:id])
		@build = Build.create(:contract_id => params[:id], :hourly_rate => '150')
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		render "professional"
	end
	
	#why is it using a new build every time for edits. 
	def hourly
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(@contract.id)
		if @build.update_attributes(params[:build])
			redirect_to root_url_path
		end
	end
		
	
end
