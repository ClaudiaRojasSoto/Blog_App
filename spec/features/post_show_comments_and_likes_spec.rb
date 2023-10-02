require 'rails_helper'

RSpec.feature 'PostShowCommentsAndLikes', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  let(:comments) { create_list(:comment, 3, post: post) }
  let(:likes) { create_list(:like, 3, post: post) }

  before do
    comments
    likes
    post.reload
    visit user_post_path(user, post)
  end

  it 'shows the username of each commentor' do
    comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  it 'shows the comment each commentor left' do
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
