require 'rails_helper'

RSpec.feature 'UserCreatesNewPost', type: :feature do
  let(:user) { create(:user) }

  before do
    visit new_user_post_path(user)
  end

  context 'Form submission' do
    it 'creates a new post when the form is submitted' do
      fill_in 'post[title]', with: 'Test Title'
      fill_in 'post[content]', with: 'Test content.'

      click_button 'Create Post'

      new_post = Post.last
      expect(page).to have_current_path(user_post_path(user, new_post))
      expect(page).to have_content('Test Title')
      expect(page).to have_content('Test content.')
    end

    it 'shows an error if title or content is missing' do
      fill_in 'post[title]', with: ''
      fill_in 'post[content]', with: 'Test content.'

      click_button 'Create Post'

      expect(page).to have_content("Title can't be blank")
    end
  end
end
