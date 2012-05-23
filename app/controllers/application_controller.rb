class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  
  def current_user
    reset_session
    session[:user_id] ||= false
    if(session[:user_id])
      user = User.find(session[:user_id])
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      return false
    end
  end
  
  protected
  
  def session_check
    if request.path == root_path && current_user #if home page, but logged in, always show dash
        redirect_to dashboards_path
    elsif request.path == root_path && !current_user #if home page, not logged in, do nothing
        true
    elsif !current_user #any other page, no session? redirect to root
        redirect_to root_path
    else
        true #any other page, valid user session, do nothing
    end
  end
  
end
