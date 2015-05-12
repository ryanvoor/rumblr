class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new

		if user.save
			redirect_to user_path
		else
			render 'new'
	end
end
