require 'rails_helper'

describe 'liking a picture' do

	before do 
		cool_pic = Post.create(caption: 'Such a great pic!')
	end

	it "can like a picture updating the like count" do 
		visit '/posts'
		click_link 'like'
		expect(page).to have_content '1 like'
	end

end