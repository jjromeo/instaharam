class PostsController < ApplicationController

	def index
        @user = User
		@posts = Post.all
	end

	def new 
		@post = Post.new
	end

	def create
        @user = current_user
		@post = @user.posts.new(params[:post].permit(:caption, :image))
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def update
		@post = Post.update(params[:id], params[:post].permit(:caption))
	end
end
