module SessionsHelper
	# logs in the given user
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		# @current_user ||= User.find_by(id: session[:user_id])
		# @current_user ||= User.where(id: session[:user_id]).first
		@users = User.all
		@users.each do |user|
			if user.id == session[:user_id]
				@current_user = user
			end
		end
		@current_user
	end

	def logged_in?
		!current_user.nil?
	end

	# logs out the current user
	def log_out
		session.delete(:user_id)
		@current_user = nil
		puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
	end
end
