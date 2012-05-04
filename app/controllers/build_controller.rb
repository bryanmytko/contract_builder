class BuildController < ApplicationController

	def edit
	  #Get contract data, build data
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(params[:id])
		
		#Get All Design & Front End Templates
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		
		#Get All CMS Templates
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
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		@webmodulite = ProfessionalPage.find_all_by_cms_type(:webmodulite)
		@magento = ProfessionalPage.find_all_by_cms_type(:magento)
		@wordpress = ProfessionalPage.find_all_by_cms_type(:wordpress)
		@cms = { 'webmodulite' => @webmodulite, 'magento' => @magento, 'wordpress' => @wordpress }
		render @contract.contract_type
	end

	def update
		@build = Build.find_by_id(params[:id])
		@saved_state = params
		@build.update_attribute(:saved_state, @saved_state)
		if @build.save
			redirect_to dashboards_path
		end
	end
	
end
