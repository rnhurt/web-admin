class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '28074249078add0da56d557754ab3fa5'

	helper_method	:logged_in?, :flash_helper

	def flash_helper

		f_names = [:notice, :warning, :message, :error]
	  fl = ''

	  for name in f_names
	    if flash[name]
	      fl = fl + "<div id=\"flash\" class=\"flash #{name}\">#{flash[name]}</div>"
	    end
		  flash[name] = nil;
		end
		return fl
	end
	
	protected
	
	def authorize
		unless logged_in?
			flash[:error] = "Unauthorized access"
			redirect_to home_path
			false
		end
	end
	
	def logged_in?
		return true if session[:is_valid]
		
		puts "*** Reading password file..."
		if session[:password] == "foobar"
			session[:is_valid] = true
			session[:user_name] = "Admin"
		end
	end
end
