require 'rails_helper'

RSpec.describe Comment, type: :model do 
  it { should belong_to :user }
  it { should belong_to :post }

  it 'should be able to reference the hashtags in it\'s post' do 
    post = create(:post) do |post|
      post.comments.create(attributes_for(:comment))
    end
    puts post.comments.first.hashtags
  end
end

