# spec/controllers/api/v1/users_controller_spec.rb
require 'rails_helper'


RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of users' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      
      get :index
      
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq([user1.as_json, user2.as_json])
    end
  end

  describe 'GET #show' do
    it 'returns a user' do
      user = FactoryBot.create(:user)
      
      get :show, params: { id: user.id }
      
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(user.as_json)
    end
  end

  describe 'POST #create' do
    it 'creates a new user' do
      user_params = FactoryBot.attributes_for(:user)
      
      post :create, params: { user: user_params }
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include('id', 'full_name', 'email')
    end
  end

  describe 'PATCH #update' do
    it 'updates a user' do
      user = FactoryBot.create(:user)
      updated_name = 'Updated Name'
      
      patch :update, params: { id: user.id, user: { full_name: updated_name } }
      user.reload
      
      expect(response).to have_http_status(:ok)
      expect(user.full_name).to eq(updated_name)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a user' do
      user = FactoryBot.create(:user)
      
      delete :destroy, params: { id: user.id }
      
      expect(response).to have_http_status(:no_content)
      expect(User.exists?(user.id)).to be_falsey
    end
  end
end
