class LikesController < ApplicationController

include ActionView::Helpers::TextHelper

def create
	@posts = Post.find(params[:post_id])
	@posts.likes.create
	render json: {new_like_count: "#{pluralize(@posts.likes.count, 'like')}" }
end

end
