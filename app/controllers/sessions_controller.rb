class SessionsController < ApplicationController
  def new
    reset_session
  end

  def create
    if User.where(username: params[:session][:username]).exists?
      @user = User.find_by(username: params[:session][:username])
    else
      @user = nil
    end

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
