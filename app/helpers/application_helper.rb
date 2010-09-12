# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def yes_no(val)
		val ? "Yes" : "No"
	end

	def status_image(status, show_image=true)

		image_name = case status
			when "Failed" then "failed"
			when "Online" then "success"
			else "pending"
		end

		if show_image then
			return "<img class\"status_image\" src=\"/images/#{image_name}.png\"/>&nbsp;#{status}"
		else
			return status
		end

	end

	def timestamp(dts)
		return dts.strftime('%Y-%m-%d %I:%M%p')
	end

	def is_admin
	
		user_id=session[:user_id]

		if user_id
			user=User.find(user_id)
			return user.is_admin
		end

	end

	def chop_for_html(string, max_length=24)
		if not string.nil? then
			if string.length <= max_length
				h(string)
			else
				"<font title=\"#{h(string)}\">#{h(string[0,max_length])}...</font>"
			end
		else
			string
		end
	end

end
