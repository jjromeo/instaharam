class Comment < ActiveRecord::Base
    belongs_to :post
    belongs_to :user

    def hashtags
      self.post.hashtags
    end
end
