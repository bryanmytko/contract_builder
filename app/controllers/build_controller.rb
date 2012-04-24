class BuildController < ApplicationController

	def edit
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(params[:id])
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		render "professional"
	end
	
	def new
		@contract = Contract.find(params[:id])
		#If there is no related build, create it
		if(!Build.exists?(:contract_id => params[:id]))
			@build = Build.create(:contract_id => params[:id], :hourly_rate => '150')
		else
			@build = Build.find_by_contract_id(params[:id])
		end
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		render "professional"
	end
	
	#not restful.. build a new controller?
	def hourly
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(@contract.id)
		if @build.update_attributes(params[:build])
			respond_to do |format|    
				format.js
  		end
		end
	end
		
	
end
