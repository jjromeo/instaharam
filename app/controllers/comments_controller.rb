class CommentsController < ApplicationController
  include HashtagHelper

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:text))
    @comment.user_id = current_user.id
    if @comment.save
      render_comment_hashtags(@comment)
    end
      redirect_to posts_path
  end
end
