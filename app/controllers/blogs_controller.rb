class BlogsController < ApplicationController
	# def index
	# 	 # @blogs = Blog.find(params[:user_id])
	# end

	def show
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:id])
		@posts = @blog.posts.all
	end

	def new
		@blog = Blog.new
	end

	def create
		@user = User.find(params[:user_id])
		@blog = @user.blogs.create(blog_params)
		if @blog.save
			redirect_to user_blog_path(@user.id, @blog.id)
		else
			render 'new'
		end
	end

	private
	 def blog_params
	 	params.require(:blog).permit(:title)
	 end
end
