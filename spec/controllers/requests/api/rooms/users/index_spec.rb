require 'rails_helper'

RSpec.describe 'GET /api/rooms/:id/users', type: :request do
  subject { get "/api/rooms/#{room.id}/users", params: params, headers: headers }

  let(:params) { {} }
  let(:headers) { {} }
  let(:category) { FactoryBot.create(:category) }
  let(:admin_user) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room, admin_user_id: admin_user.id, category_id: category.id) }

  before do
    room
  end

  context 'index api rooms-users' do
    it 'success' do
      subject
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end
  end
end
