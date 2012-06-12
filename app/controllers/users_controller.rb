class UsersController < ApplicationController
  
  #Used to create users. Not implemented yet. 
  
  def new

  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
  	redirect_to root_url, :notice => "Account created!"
  	else
  	render "new"
   end
  end
  
  def index
    @user = User.new
   render new
  end
  
end
