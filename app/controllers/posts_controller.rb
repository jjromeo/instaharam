class PostsController < ApplicationController

    def index
        @posts = Post.order("created_at desc")
    end

    def new 
        @post = Post.new
    end

    def create
        @user = current_user
        @post = @user.posts.new(params[:post].permit(:caption, :image))
        if @post.save
            parse_hashtags(@post)
            render_hashtags(@post)
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def update
        @post = Post.update(params[:id], params[:post].permit(:caption))
    end

    def destroy
        session[:return_to] ||= request.referer
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to session.delete(:return_to)
    end

    def parse_hashtags(post)
        caption = post.caption
        if  caption.include?("#")
            hashtags = caption.split.select {|word| word.start_with?('#')}
            hashtags.map {|hashtag| post.hashtags.create(content: hashtag, href:"hashtags/#{hashtag.slice(1..-1)}", post_id: post.id )}
        end
    end

    def render_hashtags(post)
        post.hashtags.each {|hashtag| post.caption = post.caption.gsub(/(#{hashtag.content})/, "<a href='/#{hashtag.href}'>#{hashtag.content}</a>")}
        post.save!
    end
end
