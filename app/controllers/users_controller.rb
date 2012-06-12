class UsersController < ApplicationController
  
  #Used to create users. Not implemented yet. 
  
  def new
   # if(User.find_by_id(1))
  #  else 
  @user = User.create
     # @user = User.create(:id => '1')
   # end
#   abort()
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
   render new
  end
  
end
