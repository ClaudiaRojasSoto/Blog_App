require 'rails_helper'

RSpec.feature 'UserIndex - Displaying users', type: :feature do
  let!(:current_user) { create(:user, id: 1) }
  let!(:other_users) { create_list(:user, 3) }

  before do
    other_users.each do |user|
      create_list(:post, 2, author: user)
    end
    visit '/users'
  end

  it 'shows the username of all other users' do
    other_users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'shows the profile picture for each user' do
    other_users.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
  end

  it 'shows the number of posts each user has written' do
    other_users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts.count}")
    end
  end
end
