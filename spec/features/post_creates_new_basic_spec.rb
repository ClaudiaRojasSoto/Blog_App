require 'rails_helper'

RSpec.feature 'PostCreatesNew', type: :feature do
  let(:user) { create(:user) }

  before do
    visit new_user_post_path(user)
  end

  context 'Form display' do
    it 'displays a form to create a new post' do
      expect(page).to have_content('New Post')
      expect(page).to have_field('post[title]')
      expect(page).to have_field('post[content]')
      expect(page).to have_button('Create Post')
    end
  end
end
