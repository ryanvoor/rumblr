class PostsController < ApplicationController

	# http_basic_authenticate_with name: "username",password: "password", except: [:index, :show]

	def index
		@posts = Post.all
	end

	def show
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		# @post = Post.new(post_params)
		@post = @blog.posts.create(post_params)
		if @post.save
			# redirect_to @post
			redirect_to user_blog_post_path(@user, @blog, @post)
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.find(params[:id])

		# if the update method fails b/c of validations then it returns false and doesn't update
		if @post.update(post_params)
			redirect_to user_blog_post_path(@user, @blog, @post)
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.find(params[:id])
		@post.destroy

		redirect_to user_blog_path(@user, @blog)
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
