class OutputController < ApplicationController
  
  def show
    
    @pmcoeff = 0.05
    @qacoeff = 0.05
    @planningcoeff = 0.1
    
    @build = Build.find(params[:id])
    @contract = Contract.find(@build.contract_id)
    @test = @build.inspect
    
    #Get All Design & Front End Templates
		@designs = ProfessionalTemplate.find_all_by_page_type(:design)
		@front_end = ProfessionalTemplate.find_all_by_page_type(:front_end)
		
		#Get All CMS Templates
		@webmodulite = ProfessionalPage.find_all_by_cms_type(:webmodulite)
		@magento = ProfessionalPage.find_all_by_cms_type(:magento)
		@wordpress = ProfessionalPage.find_all_by_cms_type(:wordpress)
		
		#Get modifications, if any
		@modifications = Modifications.find_all_by_build_id(@build.id)
		@modification_pages = ModificationPages.find_all_by_build_id(@build.id)
		
		@cms = { 'webmodulite' => @webmodulite, 'magento' => @magento, 'wordpress' => @wordpress }
		@types = { 'design' => @designs, 'frontend' => @front_end, 'cms' => @cms }
		
		@t = Time.new

    render :layout => false
  end
end
