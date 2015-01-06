require 'rails_helper'

describe 'liking a picture' do

	before do 
    jjromeo = create(:user) do |user|
      user.posts.create(attributes_for(:post))
    end
	end

	it "can like a post updating the like count", js: true do 
		visit '/posts'
		click_link 'like'
		expect(page).to have_content '1 like'
	end

end
