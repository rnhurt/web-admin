class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '28074249078add0da56d557754ab3fa5'

	helper_method	:admin?, :flash_helper, :render_flash_messages

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
		unless admin?
			flash[:error] = "unauthorized access"
			redirect_to home_path
			false
		end
	end
	
	def admin?
		false
	end
  
end
