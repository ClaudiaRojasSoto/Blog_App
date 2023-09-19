require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_likes_counter' do
    it 'updates the post\'s likes_counter' do
      create(:like, post: post, user: user)

      expect { create(:like, post: post, user: user) }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
