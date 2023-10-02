require 'rails_helper'

RSpec.feature 'UserShowBasicElements', type: :feature do
  let(:user) { create(:user) }

  before do
    visit user_path(user)
  end

  it 'displays the user profile picture' do
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  it 'displays the username' do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.posts.count}")
  end

  it 'displays the user bio' do
    expect(page).to have_content(user.bio)
  end
end
