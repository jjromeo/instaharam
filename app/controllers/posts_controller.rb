class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:caption, :image))
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
