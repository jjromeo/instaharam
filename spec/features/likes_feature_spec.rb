require 'rails_helper'

describe 'liking a picture' do

  before do 
    jjromeo = create(:user) do |user|
      @post = user.posts.create(attributes_for(:post))
    end
  end

  it "can like a post updating the like count", js: true do 
    sign_up
    visit '/posts'
    click_link 'like'
    expect(page).to have_content '1 like'
    expect(@post.likes.count).to eq 1
  end

  it "can't like a post unless signed in", js: true do 
    visit '/posts'
    expect(page).not_to have_link 'like'
  end

  it 'clicking a link twice will like and then unlike it', js: true do 
    sign_up
    visit '/posts'
    click_link 'like'
    click_link 'like'
    expect(page).to have_content '0 likes'
    expect(@post.likes.count).to eq 0
  end

end
