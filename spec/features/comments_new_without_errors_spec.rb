require 'rails_helper'

RSpec.feature 'UserCreatesNewComment', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  before do
    visit new_user_post_comment_path(user, post)
  end

  context 'Form submission' do
    it 'creates a new comment when the form is submitted' do
      fill_in 'comment[text]', with: 'Test comment text.'

      click_button 'Create Comment'

      expect(page).to have_current_path(user_post_path(user, post))
      expect(page).to have_content('Test comment text.')
    end

    it 'shows an error if comment text is missing' do
      fill_in 'comment[text]', with: ''

      click_button 'Create Comment'

      expect(page).to have_content("Text can't be blank")
    end
  end
end
