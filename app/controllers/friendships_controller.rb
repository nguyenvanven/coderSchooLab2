class FriendshipsController < ApplicationController
  def index
  	@users = User.users_are_not_already_friends(current_user)
  end

  def create
  	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  	if @friendship.save
  		flash[:success] = "You've added friend successfully"
  		redirect_to root_path
  	else
  		flash[:error] = "Cannot add friendship"
  		render 'index'
  	end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:success] = "You have removed friend successfully"
    redirect_to users_path
  end
end
