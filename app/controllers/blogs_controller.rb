class BlogsController < ApplicationController
	def index
		 # @blogs = Blog.find(params[:user_id])
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.find(blog_params)
		if @blog.save
			redirect_to user_blog_path
		else
			render 'new'
		end
	end

	private
	 def blog_params
	 	params.require(:blog).permit(:title, :posts)
	 end
end
