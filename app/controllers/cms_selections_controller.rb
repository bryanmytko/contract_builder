class CmsSelectionsController < ApplicationController
  
  def update
    @build = Build.find(params[:id])
    @build.update_attribute(:cms_type, params[:cms_type])
    @build.save
  end
  
end