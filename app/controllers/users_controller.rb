class UsersController < ApplicationController
  def index
    if !signed_in?
      redirect_to login_path
    end
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
  	@user = User.new user_params
  	if @user.save
  		redirect_to users_path, notice:"Account created successfully"
  	else
  		render 'new', notice:"Cannot save the user" 
  	end
  end

  private 
  def user_params
  	params.require(:user).permit(:username,:first_name,:last_name,:email,:password,:password_confirmation)
  end

end
