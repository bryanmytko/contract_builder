class ModificationsController < ApplicationController

  def update
    @params = params[:modification]
    if (@params[:mod_id] == '0')
      @params.delete(:mod_id)
      @modification = Modification.create(@params)
    else
      @modification = Modification.find(@params[:mod_id])
      @params.delete(:mod_id)
      @modification.update_attributes(@params)
    end
  end
  
end