class ModificationsController < ApplicationController
  
  def index
  end
  
  def show
    @description = Build.find(params[:id])
    @thing = params[:name]
    render :layout => false
  end
  
end