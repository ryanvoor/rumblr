class UsersController < ApplicationController

	# this is settings changes (changing username/password)
	# I'm seeing if putting them in this controller and
	# adding a custom route will let me do what I want to do
	def password_change
		@user = User.find(params[:id])
		# more stuff that comes from the form in the view

	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			log_in @user
			redirect_to @user
		else
			render 'new'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:username, :password, :color)
		end
end