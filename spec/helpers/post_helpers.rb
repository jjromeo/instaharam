module PostHelper
    def add_post
        visit '/'
        click_link "Add a post"
        attach_file('post[image]', 'spec/fixtures/images/default.jpeg')
        fill_in 'Caption', with: 'So much fun!'
        click_button('Create Post')
    end
end
