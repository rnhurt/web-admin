# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	## Global Constants
	###################
	$VERSION = "0.1.2"
	
	
	## Methods
	###################

	## Convert strings to numbers and format them with thousands seperators.
	def ts(st)
		st.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
	end

	## Generate a color graduated bar graph.
	def inline_bar_graph(part, whole)
		return ' ' if whole == 0
		
		percentage = ((part.to_f / whole)*100).round
		fill = percentage > 100 ? 100 : percentage
		if fill == 100
			color = "rgb(100%, 0%, 0%)"
		else
			color = "rgb(#{fill}%, 100%, 0%)"
		end
		
		content_tag :div, :class => "progress-container" do
			content_tag( :div, " ", :style => "background-color: #{color}; width: #{part}%" )			
		end
	end
	
end
