require 'rails_helper'

RSpec.feature 'UserCreatesNewComment', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  before do
    visit new_user_post_comment_path(user, post)
  end

  context 'Form display' do
    it 'displays a form to create a new comment' do
      expect(page).to have_content('New Comment')
      expect(page).to have_field('comment[text]')
      expect(page).to have_button('Create Comment')
    end
  end
end
