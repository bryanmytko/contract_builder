class AdminController < ApplicationController

	def add_professional_template
		@template = ProfessionalTemplate.new
	end
	
	def create_professional_template
		@template = ProfessionalTemplate.new(params[:professional_template])
		if @template.save
			redirect_to add_professional_template_path, :notice => 'Record Added!'
		end
	end

end
