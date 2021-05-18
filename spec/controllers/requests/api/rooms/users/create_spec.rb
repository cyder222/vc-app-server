
require 'rails_helper'


RSpec.describe 'POST /api/rooms/:id/users', type: :request do
    subject { post "/api/rooms/#{room.id}/users", params: params, headers: headers }

    let(:category) { FactoryBot.create(:category) }
    let(:admin_user) { FactoryBot.create(:user) }
    let(:join_user) { FactoryBot.create(:user) }
    let(:another_user) { FactoryBot.create(:user) }
    let(:room) { FactoryBot.create(:room, admin_user_id: admin_user.id, category_id: category.id) }
    let(:params) {}
    let(:headers) { {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json',
        'Authorization' => "Bearer #{join_user.oauth_token}"
    } }
  
    context 'create api rooms-users' do
        it 'success' do   
            subject
            expect(response).to have_http_status(:ok)      
        end
        it 'changed' do
            expect{subject}.to change{ Room.find_by(id: room.id).users.length}.from(0).to(1)
        end
    end
  end