class SessionsController < ApplicationController
  def new
  end

  def create
    # no idea if this is going to work
    # @user = User.find_by(username: params[:session][:username])
  	# @user = User.find_by(params[:session][:username])
    # puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #{User.find(params[:session][:username]).username}"
  	@users = User.all
    @users.each do |user|
      if user.username == params[:session][:username]
        @user = user
      end
    end
    if (@user && @user.password == params[:session][:password])
  		log_in @user
      redirect_to user_path(@user)
  	else
  		# This isn't completely correct according to the tutorial
  		# flash[:danger] = 'Invalid username/password combination'
  		render 'new'
  	end
  end

  def destroy
  	# should have other stuff here
  	log_out
  	redirect_to root_path
  end
end
