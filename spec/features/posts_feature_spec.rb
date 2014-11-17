require 'rails_helper.rb'
require 'helpers/session_helpers.rb'
require 'helpers/post_helpers.rb'
include SessionHelper
include PostHelper

describe 'posts' do 
	context 'no posts have been added' do 
        before do
            sign_up
        end
		it 'should display a prompt to add pictures' do 
			visit '/posts'
			expect(page).to have_content 'No posts yet'
			expect(page).to have_link 'Add a post'
		end
	end

	context 'posts have been added' do 
		before do 
            sign_up
            add_post
		end

		it 'should display posts' do 
			visit '/posts'
			expect(page).to have_content('So much fun!')
			expect(page).not_to have_content('No posts yet')
		end
	end
end


describe 'adding a post' do 
    context 'when signed in' do 
        before do
            sign_up
        end

		it 'prompts user to fill in a form and then displays post' do
            add_post
			expect(page).to have_content 'So much fun!'
		end

        it 'displays the name of the user who posted it' do 
            add_post
            expect(page).to have_content 'by tester'
        end
	end
    
    context 'when not signed in' do
        it 'does not let you post' do 
            visit '/posts'
            expect(page).not_to have_content "Add a post"
        end
    end
end


