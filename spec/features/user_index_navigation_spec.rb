require 'rails_helper'

RSpec.feature 'UserIndex - Navigation', type: :feature do
  let!(:current_user) { create(:user, id: 1) }
  let!(:other_users) { create_list(:user, 3) }

  before do
    other_users.each do |user|
      create_list(:post, 2, author: user)
    end
    visit '/users'
  end

  it 'redirects to the user show page when a user is clicked' do
    first_user = other_users.first
    within("#user-card-#{first_user.id}") do
      click_link first_user.name
    end

    expect(page).to have_current_path(user_path(first_user))
  end
end
