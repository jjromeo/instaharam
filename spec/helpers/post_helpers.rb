module PostHelper
    def add_post(caption = 'So much fun!')
        visit '/'
        save_and_open_page
        click_link "Add a post"
        attach_file('post[image]', 'spec/fixtures/images/default.jpeg')
        fill_in 'Caption', with: caption
        click_button('Create Post')
    end
end
