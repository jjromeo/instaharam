	require 'rails_helper'

	describe 'comments' do 
		before {
			Post.create(caption: 'testpost!')
		}

		it "allows users to add a comment to a post" do 
			visit '/posts'
			click_link "Comment!"
			fill_in "Text", with: "Amazing testing!"
			click_button 'send'
			expect(page).to have_content "Amazing testing!"
		end



	end