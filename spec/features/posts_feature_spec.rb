require 'rails_helper.rb'

describe 'posts' do 
	context 'no posts have been added' do 
		it 'should display a prompt to add pictures' do 
			visit '/posts'
			expect(page).to have_content 'No posts yet'
			expect(page).to have_link 'Add a post'
		end
	end

	context 'posts have been added' do 
		before do 
			Post.create(caption: 'Having fun!')
		end

		it 'should display posts' do 
			visit '/posts'
			expect(page).to have_content('Having fun!')
			expect(page).not_to have_content('No posts yet')
		end
	end
end


describe 'adding a post' do 
	context 'adding a valid post' do 
		it 'prompts user to fill in a form and then displays post' do
			visit '/posts'
			click_link "Add a post"
			attach_file('Image', 'spec/fixtures/images/default.jpeg')
			fill_in 'Caption', with: 'So much fun!'
			click_button 'Post'
			expect(page).to have_content 'So much fun!'
		end
	end
end

