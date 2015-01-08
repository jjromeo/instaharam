class Comment < ActiveRecord::Base
  after_save :parse_comment_hashtags
    belongs_to :post
    belongs_to :user

    def hashtags
      self.post.hashtags
    end

  def parse_comment_hashtags
    text = self.text 
    if text.include?("#")
      hashtags = text.split.select {|word| word.start_with?('#')}
      hashtags.map {|hashtag| self.hashtags.create(content: hashtag, href:"hashtags/#{hashtag.slice(1..-1)}", post_id: self.id)}
    end
  end
end
