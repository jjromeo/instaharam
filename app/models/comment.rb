class Comment < ActiveRecord::Base
    attr_accessible :user_id 
    belongs_to :post
    belongs_to :user
end
