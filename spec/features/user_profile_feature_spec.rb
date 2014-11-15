require 'rails_helper'
require 'helpers/session_helpers.rb'
include SessionHelper

describe 'user_profile' do
    before do 
        sign_up
        add_post
    end

    it 'shows all of the posts by that user' do 
        click_link "profile"
        expect(page).to have_content "So much fun!"
    end
end
