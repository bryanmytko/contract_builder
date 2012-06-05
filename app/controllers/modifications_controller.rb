class ModificationsController < ApplicationController

  def update
    @params = params[:modification]
    if(@params[:cms_type])
      updatePages
    elsif(@params[:page_type])
      updateTemplate
    end
  end
  
  private 
  
  def updateTemplate
    if (@params[:mod_id] == '0')
      @params.delete(:mod_id)
      @modification = Modification.create(@params)
      @string = 'new'
    else
      @modification = Modification.find(@params[:mod_id])
      @params.delete(:mod_id)
      @modification.update_attributes(@params)
      @string = @modification.description.html_safe
    end
    render 'updateTemplate'
  end
  
  private
  
  def updatePages
    if (@params[:mod_id] == '0')
      @params.delete(:mod_id)
      @modification = ModificationPages.create(@params)
    else
      @modification = ModificationPages.find(@params[:mod_id])
      @params.delete(:mod_id)
      @modification.update_attributes(@params)
    end
    render 'updatePages'
  end
  
end