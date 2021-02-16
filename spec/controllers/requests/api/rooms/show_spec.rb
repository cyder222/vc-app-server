RSpec.describe 'GET /api/rooms/:id', type: :request do
  subject { get "/api/rooms/#{rooms_uid}" }

  let(:rooms_uid) { rooms[0].id }
  let(:headers) { {} }
  let(:category) { FactoryBot.create(:category) }
  let(:user) { FactoryBot.create(:user) }
  let(:rooms) { FactoryBot.create_list(:room, 3, admin_user_id: user.id, category_id: category.id) }

  before do
    rooms
  end

  context 'show api rooms' do
    it 'success' do
      subject
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end
  end
end
