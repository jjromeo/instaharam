require 'rails_helper'

describe 'liking a picture' do

	before do 
    jjromeo = User.create(email:"jjrome@jjromeo.com", password: "password")
		jjromeo.posts.create(caption: 'Such a great pic!')
	end

	it "can like a post updating the like count", js: true do 
		visit '/posts'
		click_link 'like'
		expect(page).to have_content '1 like'
	end

end
