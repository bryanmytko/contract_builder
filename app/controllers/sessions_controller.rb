class SessionsController < ApplicationController
  def new
    @title = "Login"
    #session_check
  end
  
  def create
    user = User.authenticate(params[:email],params[:password])
    if user
        session[:user_id] = user.id
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
