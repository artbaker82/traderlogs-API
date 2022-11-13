require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'create new registration' do
    context 'with valid params' do

      before do
        post '/users', params: { user: FactoryBot.attributes_for(:user) }
      end
      
      it 'returns created user message' do
        expect(JSON.parse(response.body)["message"]).to eq('Signed up sucessfully.')
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
  
      # it 'returns user params' do
        
      # end
  
      it 'returns a bearer token ' do
        expect(response.headers["Authorization"]).to be_truthy
      end
    end

    context "with invalid params" do
      
      it 'has no attributes' do
        post '/users', params: { user: { email: '', password: ''} }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'has no password confirmation' do 
        post '/users', params: { user: { email: 'test@gmail.com', password: 'test', password_confirmation: ''} }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'has mismatching password and password confirmation' do
        post '/users', params: { user: { email: 'test@gmail.com', password: 'test', password_confirmation: 'tes'} }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      # it 'has invalid email' do
        
      # end

      # it 'has no password' do
        
      # end
    end

    #get response headers and sign out
  end
end