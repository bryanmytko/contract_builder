class Admin::ProfessionalTemplateController < ApplicationController

def index
	@templates = ProfessionalTemplate.find(:all)
	@new_template = ProfessionalTemplate.new
	if(params[:page_type] == 'design')
		render :action => 'design'
	end
end

def create
	@template = ProfessionalTemplate.new(params[:professional_template])
	if @template.save
		redirect_to admin_professional_template_index_path(:page_type => 'design')
	end
end

def edit
end

def update
	@template = ProfessionalTemplate.find(params[:id])
	if @template.update_attributes(params[:professional_template])
		redirect_to admin_professional_template_index_path(:page_type => 'design')
	end
end
	
end
