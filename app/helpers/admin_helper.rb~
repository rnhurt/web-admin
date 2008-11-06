module AdminHelper

	def generate_navigation (menu_items)
		list_items_html	= ''
		menu_items.each do |menu_item|
			list_items_html << content_tag('li', content_tag(:span, link_to( content_tag(:span, menu_item[:text], {:class => 'menu_ar'}),menu_item[:url]), :class => 'menu_r'), 
				:class => set_class_if_current(menu_item[:url])
			)
		end
		content_tag('ul', list_items_html)
	end

	def get_uptime
		# Get the number of seconds of uptime
		total_seconds = 0
		File.open("/proc/uptime", "r") do |file|
			while line = file.gets
				total_seconds = line.split[0].to_i
			end
		end
		
		# Format the data for printing
		secs		= total_seconds % 60
		mins		= total_seconds / 60 % 60
		hours = total_seconds / 3600 % 24
		days = total_seconds / 86400
		
		return { :days => days, :hours => hours, :minutes => mins, :seconds => secs, :offset => Time.now - total_seconds }		
	end

	def get_meminfo
		# Gather memory statistics
		memtotal	= 0
		memfree		= 0
		File.open("/proc/meminfo", "r") do |file|
			while line = file.gets
				memtotal	= line.split[1] if (line =~ /^MemTotal/)
				memfree		= line.split[1] if (line =~ /^MemFree/)
			end
		end
		
		return { :total => memtotal, :free => memfree }
	end
	
	def get_partitioninfo
		# Gather hard drive statistics
		partition_info = Array.new
		lines = `df`
		lines.each do |line|
				if (line =~ /^\/dev\//)
					partition_info << { :device 					=> line.split[0],
															:total_blocks			=> line.split[1].to_i,
															:used_blocks			=> line.split[2].to_i,
															:available_blocks	=> line.split[3].to_i,
															:percentage_used	=> line.split[4].to_i,
															:mount_point			=> line.split[5],
														}
				end
		end
		
		return partition_info
	end


private

	def set_class_if_current(path)
		'highlight' if current_page?(path)
	end
end