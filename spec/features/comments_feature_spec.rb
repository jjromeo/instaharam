require 'rails_helper'

describe 'comments' do 

  it "allows users to add a comment to a post" do 
    sign_up
    add_post
    visit '/posts'
    click_link "Comment!"
    fill_in "Text", with: "Amazing testing!"
    click_button 'send'
    expect(page).to have_content "Amazing testing!"
  end

  it 'mentions who posted it' do 
    sign_up
    add_post
    click_link 'Sign out'
    sign_up('jerome@test.com', 'jjromeo')
    visit '/posts'
    click_link "Comment!"
    fill_in "Text", with: "Amazing testing!"
    click_button 'send'
    expect(page).to have_content "by jjromeo"
  end

  it 'creates clickable hashtags when comments are made' do 
    sign_up
    add_post
    click_link 'Sign out'
    sign_up('jerome@test.com', 'jjromeo')
    visit '/posts'
    click_link "Comment!"
    fill_in "Text", with: "Amazing #comments" 
    click_button 'send'
    click_link '#comments'
    expect(page).to have_content 'So much fun!'
  end



end
