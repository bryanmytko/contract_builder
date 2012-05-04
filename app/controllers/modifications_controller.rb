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
    @mod_id = params[:mod_id][0].to_i
    if(@mod_id == 0)
      render 'fail'
    else
      render 'update'
    end
  end
  
end