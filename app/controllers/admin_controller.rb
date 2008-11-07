class AdminController < ApplicationController
	before_filter :authorize, :except => :index
	
end
