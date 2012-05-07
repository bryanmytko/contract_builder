class ModificationsController < ApplicationController
  
  def index
  end
  
  def show
    #@build = Build.find(params[:id])
    #abort(params[:id])
   # @thing = params[:name]
    
    
    
    
    #@modification = Modification.create(params[:name]
    #render :layout => false
  end
  
  def update
    @params = params[:modification]
    if (@params[:design_id] == '0')
      @params[:design_id] = @params[:design_template_id]
      @params.delete(:design_template_id)
      @modification = Modification.create(@params)
      render 'show'
    else
      @modification = Modification.find(@params[:design_id])
      @params[:design_id] = @params[:design_template_id]
      @params.delete(:design_template_id)
      @modification.update_attributes(@params)
      render 'update'
    end
    
  end
  
end