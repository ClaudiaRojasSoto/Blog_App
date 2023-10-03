require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'GET /users/:user_id/posts/:post_id/comments' do
    it 'returns http success' do
      get new_user_post_comment_path(user.id, post.id)
      expect(response).to have_http_status(:success)
    end
  end
end
