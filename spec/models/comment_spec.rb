require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should belong_to(:post) }
  end

  describe '#update_comments_counter' do
    it 'updates the post\'s comments_counter' do
      create(:comment, post: post, author: user)

      expect { create(:comment, post: post, author: user) }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
