require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'displays the correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('All Users')
    end

    # Agregar más pruebas según las acciones de UsersController que tengas.
  end

  describe 'GET /users/:id' do
    it 'returns a successful response' do
      user = FactoryBot.create(:user, name: 'Test User')
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      user = FactoryBot.create(:user, name: 'Test User')
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'displays the correct placeholder text in the response body' do
      user = FactoryBot.create(:user, name: 'Test User')
      get user_path(user)
      expect(response.body).to include('User Information')
    end

    # Agregar más pruebas según las acciones de UsersController que tengas.
  end
end
