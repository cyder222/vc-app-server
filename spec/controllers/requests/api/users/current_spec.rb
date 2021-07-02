require 'rails_helper'

RSpec.describe 'GET /api/users/current', type: :request do
  subject { get '/api/users/current', params: params, headers: headers }

  let(:params) { {} }
  let(:headers) { {} }
  let(:category) { FactoryBot.create(:category) }
  let(:user) { FactoryBot.create(:user) }

  before {
    sign_in user
    get '/api/users/current',
        params: params.to_json,
        headers: {
          'CONTENT_TYPE' => 'application/json',
          'ACCEPT' => 'application/json',
                'Authorization' => "Bearer #{user.oauth_token}"
        }
  }

  context 'current user' do
    it 'success' do
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end
  end
end
