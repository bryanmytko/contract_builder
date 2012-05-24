class SessionsController < ApplicationController
  def new
    @title = "Login"
    session_check('new')
  end
  
  def create
    user = User.authenticate(params[:email],params[:password])
    if user
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
