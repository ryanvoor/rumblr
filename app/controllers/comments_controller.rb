class CommentsController < ApplicationController

	# http_basic_authenticate_with name: "username", password: "password", only: :destroy

	def create
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to user_blog_post_path(@user, @blog, @post)
	end

	def destroy
		@user = User.find(params[:user_id])
		@blog = Blog.find(params[:blog_id])
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to user_blog_post_path(@user, @blog, @post)
	end

	private
		def comment_params
			@user = current_user
			params.require(:comment).permit(:body).merge!(commenter: @user.username)
		end
end
