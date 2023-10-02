require 'rails_helper'

RSpec.feature 'UserPostsIndexPart1', type: :feature do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 5, author: user) }
  let!(:comments) { create_list(:comment, 3, post: posts.first, author: user) }
  let!(:likes) { create_list(:like, 3, post: posts.first, user: user) }

  before do
    visit user_posts_path(user)
  end

  describe 'User Information' do
    it "shows the user's profile picture" do
      expect(page).to have_css("img[src*='#{user.photo}']")
    end

    it "shows the user's username" do
      expect(page).to have_content(user.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{user.posts.count}")
    end
  end

  describe 'Post Information' do
    it 'shows the post title' do
      expect(page).to have_content(posts.first.title)
    end

    it 'shows some of the post content' do
      expect(page).to have_content(posts.first.content[0..10])
    end
  end
end
