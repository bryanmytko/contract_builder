class Admin::ProfessionalTemplatesController < ApplicationController

	def index
	end

	def new
		@template = ProfessionalTemplate.new
	end
	
	def create
		@template = ProfessionalTemplate.new(params[:professional_template])
		#if @template.save
			#redirect_to professional_templates_path, :notice => 'Record Added!'
		#end
	end

end
