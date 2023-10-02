require 'rails_helper'

RSpec.feature 'PostShowBasicElements', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  before do
    visit user_post_path(user, post)
  end

  it "shows the post's title" do
    expect(page).to have_content(post.title)
  end

  it 'shows who wrote the post' do
    expect(page).to have_content("by #{user.name}")
  end

  it 'shows how many comments it has' do
    expect(page).to have_content("Comments: #{post.comments.count}")
  end

  it 'shows how many likes it has' do
    expect(page).to have_content("Likes: #{post.likes.count}")
  end

  it 'shows the post body' do
    expect(page).to have_content(post.content)
  end
end
