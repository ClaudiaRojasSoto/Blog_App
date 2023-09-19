require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }

  describe 'Associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#five_most_recent_comments' do
    it 'returns the five most recent comments for the post' do
      post = create(:post, author: user)
      create_list(:comment, 5, post: post, created_at: 1.month.ago)
      recent_comments = create_list(:comment, 5, post: post)

      expected_comment_ids = recent_comments.pluck(:id).sort.reverse
      actual_comment_ids = post.five_most_recent_comments.pluck(:id).sort.reverse

      expect(actual_comment_ids).to eq(expected_comment_ids)
    end
  end

  describe '#update_post_counter' do
    it 'updates the author\'s post_counter' do
      create(:post, author: user)
      expect { create(:post, author: user) }.to change { user.reload.post_counter }.by(1)
    end
  end
end
