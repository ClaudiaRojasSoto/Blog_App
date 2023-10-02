require 'rails_helper'

RSpec.describe 'PostIndexCommentsAndNavigation', type: :feature do
  before(:each) do
    puts "Current User IDs: #{User.pluck(:id).inspect}"
  end

  let!(:user) { create(:user, id: 1) }

  let!(:posts) do
    create_list(:post, 5, author: user).each do |post|
      create_list(:comment, 3, post: post, author: user)
    end
  end

  context 'Post Comments and Likes' do
    it 'shows the first comments on a post' do
      visit user_posts_path(user.id)

      puts "First post's ID: #{posts.first.id}"

      post = posts.first
      within(:css, "#post-#{post.id} + .user-card") do
        first_comment = post.five_most_recent_comments.first
        expect(page).to have_content(first_comment.text)
      end
    end

    it 'shows the number of comments a post has' do
      visit user_posts_path(user.id)

      puts "First post's ID: #{posts.first.id}"

      within("#post-#{posts.first.id}") do
        correct_count = posts.first.five_most_recent_comments.count
        expect(page).to have_content("Comments: #{correct_count}")
      end
    end
  end
end
