class Admin::ProfessionalPagesController < ApplicationController

	def index
		@cms_type = params[:cms_type]
		@pages = ProfessionalPage.find_all_by_cms_type(@cms_type)
		@new_page = ProfessionalPage.new
		@features = [
									 'Content Management',
									 'Forms',
									 'Events',
									 'Media Content',
									 'Store & Location Items',
									 'Polls',
									 'Third-party Solutions',
									 'Other Pages',
									 'Banners',
									 'Live Chat',
									 'Multiple Languages',
									 'Ecommerce - Login & Registration',
									 'Ecommerce - User Accounts',
									 'Ecommerce - Product Category Management',
									 'Ecommerce - Products Management',
									 'Ecommerce - Customer Relationship Management',
									 'Ecommerce - Promotions',
									 'Ecommerce - Product Search & Other Pages',
									 'Ecommerce - Shopping Cart',
									 'Ecommerce - Checkout',
									 'Ecommerce - Other',
									 'Ecommerce - Setup'
								 ]
		session_check('index')
	end

	def create
		@page = ProfessionalPage.new(params[:professional_page])
		@page.save
		respond_to do |format|    
			format.js
		end
	end
	
	def destroy
		@page = ProfessionalPage.find(params[:id])
		@page.destroy
		respond_to do |format|    
			format.js
		end 
	end

	def update
	  logger.debug '#Params: ' + params.inspect + '###'
		@page = ProfessionalPage.find(params[:id])
		@page.update_attributes(params[:professional_page])
		render :template => 'admin/professional_pages/update'
	end

end
