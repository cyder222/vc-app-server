require 'rails_helper'


RSpec.describe 'post /api/rooms', type: :request do
    let(:user) { FactoryBot.create(:user)}
    let(:auth_headers) { user.create_new_auth_token }
    let(:category) { FactoryBot.create(:category)}
    let(:params) {{
        title: "test room",
        description: "this is test room",
        max_user_num: 4,
        main_language: "ja",
        category_id: category.id
    }}

    before {
		sign_in user
		post "/api/rooms",
		params: params.to_json,
		headers: {
			'CONTENT_TYPE' => 'application/json',
			'ACCEPT' => 'application/json',
			'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
		}
	}
    it 'create rooms' do
        expect(response.status).to eq(200)
    end
end