module HashtagHelper
  
  def render_hashtags(post)
    post.hashtags.each {|hashtag| post.caption = post.caption.gsub(/(#{hashtag.content})/, "<a href='/#{hashtag.href}'>#{hashtag.content}</a>")}
    post.save!
  end

  def render_comment_hashtags(comment)
    comment.hashtags.each {|hashtag| comment.text = comment.text.gsub(/(#{hashtag.content})/, "<a href='/#{hashtag.href}'>#{hashtag.content}</a>")}
    comment.save!
  end

  def search
    @disable_separator = true
    @hashtag = params[:keyword]
    @posts = Post.order("created_at desc").select do |post| 
      post.hashtags.any? { |hashtag| hashtag.content.include?(@hashtag)}
    end
  end
end
