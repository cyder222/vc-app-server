# frozen_string_literal: true

RSpec.describe 'GET /api/categories', type: :request do
  subject { get '/api/categories', params: params, headers: headers }

  let(:params) { {} }
  let(:headers) { {} }
  let(:categories) { FactoryBot.create_list(:category, 3) }

  before do
    categories
  end

  context 'index api categories' do
    it 'success' do
      subject
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end
  end
end
