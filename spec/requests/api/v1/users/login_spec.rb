# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Login' do
  it 'responds with user info if user already exists in db' do
    user = create(:user)
    user_params = { user_data: { uid: user.google_id,
                                 info: {
                                   name: user.name,
                                   email: user.email,
                                   image: user.image
                                 },
                                 credentials: {
                                   token: user.auth_token,
                                   refresh_token: user.refresh_token,
                                   expires_at: user.token_expiration
                                 } } }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    user_response_checker(user, User.last)
  end
end
