require 'rails_helper'

describe 'comments' do 

  it "allows users to add a comment to a post" do 
    sign_up
    add_post
    visit '/posts'
    fill_in 'comment[text]', with: "Amazing testing!"
    click_button 'comment'
    expect(page).to have_content "Amazing testing!"
  end

  it 'mentions who posted it' do 
    sign_up
    add_post
    click_link 'Sign out'
    sign_up('jerome@test.com', 'jjromeo')
    visit '/posts'
    fill_in 'comment[text]', with: "Amazing testing!"
    click_button 'comment'
    expect(page).to have_content "jjromeo"
  end

  it 'creates clickable hashtags when comments are made' do 
    sign_up
    add_post
    click_link 'Sign out'
    sign_up('jerome@test.com', 'jjromeo')
    visit '/posts'
    fill_in 'comment[text]', with: "Amazing #comments"
    click_button 'comment'
    click_link '#comments'
    expect(page).to have_content 'So much fun!'
  end



end
