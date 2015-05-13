class BlogsController < ApplicationController
	# def index
	# 	 # @blogs = Blog.find(params[:user_id])
	# end

	def show
		@user = User.find(params[:user_id])
		# @blog = @user.blogs.find(params[:id])
		@blog = Blog.find(params[:id])
		@posts = @blog.posts.all
	end

	def new
		@blog = Blog.new
	end

	def create
		@user = User.find(params[:user_id])
		@blog = @user.blogs.create(blog_params)
		if @blog.save
			redirect_to user_blog_path(@user, @blog)

		else
			render 'new'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:id])
		@blog.destroy

		redirect_to user_path(@user)
	end

	private
	 def blog_params
	 	params.require(:blog).permit(:title)
	 end
end
