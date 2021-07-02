require 'rails_helper'

RSpec.describe 'DELETE /api/rooms/:id/users', type: :request do
  subject { delete "/api/rooms/#{room.id}/users/#{join_user.id}", params: params.to_json, headers: headers }
  let(:category) { FactoryBot.create(:category) }
  let(:admin_user) { FactoryBot.create(:user) }
  let(:join_user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room, admin_user_id: admin_user.id, category_id: category.id) }
  let(:params) {
    {
    }
  }
  let(:headers) {
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json',
      'Authorization' => "Bearer #{join_user.oauth_token}"
    }
  }

  context 'delete api rooms-users' do
    it 'success' do
      subject
      expect(response).to have_http_status(:ok)
    end
    it 'changed' do
      RoomUser.join(room: room, user: join_user)
      expect { subject }.to change { Room.find_by(id: room.id).users.length }.from(1).to(0)
    end

    it 'fail on api user is not same as :id user' do
      delete "/api/rooms/#{room.id}/users/#{another_user.id}", params: params.to_json, headers: headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
