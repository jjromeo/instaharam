class PostsController < ApplicationController
  include HashtagHelper

  def index
    @disable_separator = true
    @post = Post.new
    @posts = Post.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(params[:post].permit(:caption, :image))
    if @post.save
      render_hashtags(@post)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  # CHECK new hashtags may not be rendered when updating a post
  def update
    @post = Post.update(params[:id], params[:post].permit(:caption))
  end

  def destroy
    session[:return_to] ||= request.referer
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to session.delete(:return_to)
  end

end
