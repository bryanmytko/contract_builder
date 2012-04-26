class Admin::ProfessionalTemplatesController < ApplicationController

	def index
		@type = params[:page_type]
		@templates = ProfessionalTemplate.find_all_by_page_type(@type)
		@new_template = ProfessionalTemplate.new
		render :action => @type
	end

	def create
		@template = ProfessionalTemplate.new(params[:professional_template])
		@template.save
		respond_to do |format|    
			format.js
		end
	end

	def destroy
		@template = ProfessionalTemplate.find(params[:id])
		@template.destroy
		respond_to do |format|    
			format.js
		end 
	end

	def update
		@template = ProfessionalTemplate.find(params[:id])
		@template.update_attributes(params[:professional_template])
		respond_to do |format|    
			format.js
		end
	end
	
end
