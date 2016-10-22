class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
  	if session[:user_id]
  		if @current_user.nil?
  			@current_user = User.find_by_id(session[:user_id])
  		end
  		return @current_user
  	end
  end


  def signed_in?
  	return session[:user_id].present?
  end
end
