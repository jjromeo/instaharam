module HashtagHelper
  
  def render_hashtags(post)
    post.hashtags.each {|hashtag| post.caption = post.caption.gsub(/(#{hashtag.content})/, "<a href='/#{hashtag.href}'>#{hashtag.content}</a>")}
    post.save!
  end

  def parse_post_hashtags(post)
    caption = post.caption
    if  caption.include?("#")
      hashtags = caption.split.select {|word| word.start_with?('#')}
      hashtags.map {|hashtag| post.hashtags.create(content: hashtag, href:"hashtags/#{hashtag.slice(1..-1)}", post_id: post.id )}
    end
  end

  def render_comment_hashtags(comment)
    comment.hashtags.each {|hashtag| comment.text = comment.text.gsub(/(#{hashtag.content})/, "<a href='/#{hashtag.href}'>#{hashtag.content}</a>")}
    comment.save!
  end

  def parse_comment_hashtags(comment)
    text = comment.text 
    if text.include?("#")
      hashtags = text.split.select {|word| word.start_with?('#')}
      hashtags.map {|hashtag| comment.hashtags.create(content: hashtag, href:"hashtags/#{hashtag.slice(1..-1)}", post_id: comment.post.id)}
    end
  end

  def search
    @disable_separator = true
    @hashtag = params[:keyword]
    @posts = Post.order("created_at desc").select do |post| 
      post.hashtags.any? { |hashtag| hashtag.content.include?(@hashtag)}
    end
  end
end
