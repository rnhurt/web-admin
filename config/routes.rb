ActionController::Routing::Routes.draw do |map|
#	map.root :controller => "admin"
#	map.home '/admin', :controller => "admin"
#  map.sessions '/logout', :controller => "sessions", :action => "destroy"
#  map.sessions '/login', :controller => "sessions", :action => "create"

#  map.connect ':controller/:action/:id', :controller => "admin"
#  map.connect ':controller/:action/:id.:format', :controller => "admin"

	map.resources	:admin, :sessions
	
	map.home '', :controller => 'admin', :action => 'index'
	
	map.status	'status',		:controller => 'admin', :action => 'index'
	map.network	'network',	:controller => 'admin', :action => 'network'
	map.email		'email', 		:controller => 'admin', :action => 'email'
	map.email		'datetime', :controller => 'admin', :action => 'datetime'
	map.user		'user', 		:controller => 'admin', :action => 'user'
	
	map.login 'login', :controller => 'sessions', :action => 'new'
	map.logout 'logout', :controller => 'sessions', :action => 'destroy'
	
#	map.connect ':controller/:action/:id.:format'
#	map.connect ':controller/:action/:id'
end
