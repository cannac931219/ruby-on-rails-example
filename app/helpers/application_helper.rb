module ApplicationHelper
	def is_active(controller, action, active)
		# puts '++++++++++'
		# puts params[:controller]
		# puts '----------'
		# params[:controller] 为last rows
		if controller == params[:controller] && action == params[:action] 
			active = 'active'
		end
	end
end
