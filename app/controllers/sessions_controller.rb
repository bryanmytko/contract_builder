class SessionsController < ApplicationController
  def new
    @title = "Login"
    session_check('new')
  end
  
  def create
    
    session[:admin] = nil
    session[:user_id] = nil
    
    user = User.authenticate(params[:email],params[:password])
    admin = User.auth_admin(params[:email])
    if user
      if admin
        session[:admin] = user.email
      end
        session[:user_id] = user.id
        session[:tab] = 'webready'
        redirect_to dashboards_path
    else
        redirect_to root_url, :notice => "Invalid email or password"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice=>"Logged out"
  end
end
