require 'rails_helper'

RSpec.describe Comment, type: :model do 
  it { should belong_to :user }
  it { should belong_to :post }

  it 'should be able to reference the hashtags in it\'s post' do 
    post = create(:post) do |post|
      @comment = post.comments.create(attributes_for(:comment))
    end
    expect(@comment.hashtags.first.content).to eq '#hashtag'
  end
end

