require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let(:user) { create(:user) }
  let(:post_record) { create(:post, author: user) }

  describe 'POST /users/:user_id/posts/:post_id/likes' do
    it 'returns http success after creating a like' do
      post user_post_likes_path(user.id, post_record.id)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_post_path(user, post_record))
    end
  end
end
