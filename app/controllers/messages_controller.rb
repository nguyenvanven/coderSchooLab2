class MessagesController < ApplicationController
  def index
  	@messages = Message.find_by_user(session[:user_id])
  	#Message.mark_as_read_all(session[:user_id])
  end

  def new
  	@users = current_user.friends
  end

  def create
  	if params[:receiver].present? and params[:text].present?
  		Message.create(receiver_id:params[:receiver], sender_id:current_user.id, text:params[:text])
  		flash[:success] = "Your message has been sent"
  		redirect_to messages_view_sent_messages_path
  	else
  		flash[:error] = "please enter message"
  		render 'new'
  	end

  end

  def show
    @messages = Message.find_by_sender(current_user.id)
  end

end
