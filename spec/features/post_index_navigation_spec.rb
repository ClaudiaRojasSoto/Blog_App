# spec/features/post_index_navigation_spec.rb

require 'rails_helper'

RSpec.feature 'PostIndexNavigation', type: :feature do
  let!(:user) { create(:user, id: 1) }
  let!(:posts) { create_list(:post, 5, author: user) }

  it 'navigates to the show page when a post is clicked' do
    visit user_posts_path(user.id)
    first_post = posts.first

    within("#post-#{first_post.id}") do
      click_link first_post.title
    end

    expect(page).to have_current_path(user_post_path(user, first_post))
  end

  it 'shows pagination when there are more posts than fit on one page' do
    create_list(:post, 10, author: user)
    visit user_posts_path(user.id)
    expect(page).to have_css('.button')
  end
end
