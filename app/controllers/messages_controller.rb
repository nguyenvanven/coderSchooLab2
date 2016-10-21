class MessagesController < ApplicationController
  def index
  	@messages = Message.find_by_sender(session[:user_id])
  	
  end

  def new
  	@users = User.all
  end

  def create
  	if params[:receiver].present? and params[:text].present?
  		Message.create(receiver_id:params[:receiver], sender_id:current_user.id, text:params[:text])
  		flash[:success] = "Your message has been sent"
  		redirect_to new_message_path
  	else
  		flash[:error] = "please enter message"
  		render 'new'
  	end

  end
end
