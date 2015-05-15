class SessionsController < ApplicationController
  def new
  end

  def create
  	# render 'new'
  	# b/c user validates uniqueness for the username field this should always work
  	# @user = User.where(params[:session][:username]).first

  	# this is what i would think based on my experience with ActiveRecord
  	@user = User.find_by(params[:session][:username])

  	# @user = User.find(params[:session][:user_id])

  	# for this attempt it says that 'db' is not a recognized variable
  	# @user = db.User.all.findOne(username: params[:session][:username])
  	# most recent attempt based on something I saw near the end of the 194 railscasts videos
  	# @user = User.all(:username => params[:session][:username])
  	if @user && @user.password == params[:session][:password]
  		log_in @user
  		redirect_to user_path(@user)
  	else
  		# the tutorial wanted me to create an error message here
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end
