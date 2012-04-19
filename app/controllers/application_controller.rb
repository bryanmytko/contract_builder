class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  protected
  
  def session_check
    if request.path == root_path && current_user #if home page, but logged in, always show dash
        redirect_to dashboard_path
    elsif request.path == root_path && !current_user #if home page, not logged in, do nothing
        true
    elsif !current_user #any other page, no session? redirect to root
        redirect_to root_path
    else
        true #any other page, valid user session, do nothing
    end
  end
  
end
