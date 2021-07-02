require 'rails_helper'

RSpec.describe 'GET /api/users/:user_id', type: :request do
  subject { get "/api/users/#{user.id}" }

  let(:user) { FactoryBot.create(:user) }
  let(:user_id) { user.id }

  before do
    user
  end
  context 'user' do
    it 'success' do
      subject
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end
  end
end
