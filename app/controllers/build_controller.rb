class BuildController < ApplicationController

	def edit
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(params[:id])
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		@webmodulite = ProfessionalPage.find_all_by_cms_type(:webmodulite)
		@magento = ProfessionalPage.find_all_by_cms_type(:magento)
		@wordpress = ProfessionalPage.find_all_by_cms_type(:wordpress)
		@cms = { 'webmodulite' => @webmodulite, 'magento' => @magento, 'wordpress' => @wordpress }
		render @contract.contract_type
	end
	
	def new
		@contract = Contract.find(params[:id])
		#If there is no related build, create it
		if(!Build.exists?(:contract_id => params[:id]))
			@build = Build.create(:contract_id => params[:id], :hourly_rate => '150')
		else
			@build = Build.find_by_contract_id(params[:id])
		end
		#make helpers for this stuff
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		@webmodulite = ProfessionalPage.find_all_by_cms_type(:webmodulite)
		@magento = ProfessionalPage.find_all_by_cms_type(:magento)
		@wordpress = ProfessionalPage.find_all_by_cms_type(:wordpress)
		@cms = { 'webmodulite' => @webmodulite, 'magento' => @magento, 'wordpress' => @wordpress }
		render @contract.contract_type
	end

	
	def update
	end
	
end
