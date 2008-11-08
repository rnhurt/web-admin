class SessionsController < ApplicationController

	def create
		session[:password] = params[:password]
		if logged_in?
			flash[:notice] = 'Successfully logged in'
			redirect_to home_path
		else
			flash[:warning] = 'Incorrect password'
			redirect_to login_path
		end
	end
	
	def destroy
		reset_session
		flash[:notice] = 'Successfully logged out'
		redirect_to home_path
	end
end
