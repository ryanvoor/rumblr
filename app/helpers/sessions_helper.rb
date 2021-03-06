module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id.to_s
	end

	def log_out
		session.delete(:user_id)
  	@current_user = nil
	end

	def current_user
		if User.where(id: session[:user_id]).exists?
			User.find_by(id: session[:user_id])
		else
			nil
		end
	end

	def logged_in?
		!current_user.nil?
	end
end
