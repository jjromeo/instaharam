require 'rails_helper'
require 'helpers/session_helpers.rb'
include SessionHelper

describe 'user_profile' do

    it 'displays a message if there aren\'t any posts by that user' do
        sign_up
        click_link "Profile"
        expect(page).to have_content "This is where tester's posts will show"
    end

    it 'shows all of the posts by that user' do 
        sign_up
        add_post
        click_link "Profile"
        expect(page).to have_content "So much fun!"
        expect(current_path).not_to eq "/posts"
        expect(current_path).not_to eq "/"
    end

    it 'exists for other users' do 
        sign_up('jjromeo@test.com', 'jjromeo')
        add_post('jjromeo loves 2 post')
        click_link "Sign out"
        sign_up
        add_post
        click_link "jjromeo"
        expect(page).to have_content 'jjromeo loves 2 post'
        expect(page).not_to have_content 'So much fun!'
    end
end
