class LikesController < ApplicationController

include ActionView::Helpers::TextHelper

def create
	@post = Post.find(params[:post_id])
  if @post.likes.any? { |like| like.user_id == current_user.id }
    @post.likes.where(user_id: current_user.id).first.destroy
  else
    @post.likes.create(user_id: current_user.id)
  end
	render json: {new_like_count: "#{pluralize(@post.likes.count, 'like')}" }
end

def index
	render json: {new_like_count: "#{pluralize(@post.likes.count, 'like')}" }
end

end
