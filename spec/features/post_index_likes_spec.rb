require 'rails_helper'

RSpec.feature 'PostIndexLikes', type: :feature do
  let!(:user) { create(:user, id: 1) }

  let!(:posts) do
    create_list(:post, 5, author: user).each do |post|
      create_list(:like, 2, post: post, user: user)
    end
  end

  it 'shows the number of likes a post has' do
    visit user_posts_path(user.id)

    within("#post-#{posts.first.id}") do
      correct_like_count = posts.first.likes.count
      expect(page).to have_content("Likes: #{correct_like_count}")
    end
  end
end
