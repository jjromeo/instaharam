require 'rails_helper'

xdescribe 'liking a picture' do

	before do 
		cool_pic = Post.create(caption: 'Such a great pic!')
	end

	it "can like a post updating the like count", js: true do 
		visit '/posts'
		click_link 'like'
		expect(page).to have_content '1 like'
	end

end