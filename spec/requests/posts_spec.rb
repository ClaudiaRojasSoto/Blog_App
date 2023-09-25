require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # Crear un usuario para las pruebas
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /user/:user_id/posts' do
    it 'returns a successful response' do
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(user_id: user.id)
      expect(response).to render_template(:index)
    end

    it 'displays the correct placeholder text in the response body' do
      get user_posts_path(user_id: user.id)
      expect(response.body).to include('All Posts')
    end
  end

  describe 'GET /user/:user_id/posts/:id' do
    it 'returns a successful response' do
      post = FactoryBot.create(:post, author: user)
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      post = FactoryBot.create(:post, author: user)
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to render_template(:show)
    end

    it 'displays the correct placeholder text in the response body' do
      post = FactoryBot.create(:post, author: user)
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.body).to include('Total Comments')
    end
  end
end
