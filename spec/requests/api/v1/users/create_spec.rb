# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create User' do
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

  it 'responds with new user info if user does not exist in db' do
    user_params = { client_id: '101010',
                    user_data: { uid: '121212121',
                                 info: { name: 'Elon Musk',
                                         email: 'elonistheman@email.com',
                                         image: 'elonbeingcoolerthanyou.imgur.com' },
                                 credentials: { token: '0101010101',
                                                refresh_token: '1010101010101',
                                                expires_at: 123123123 } } }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    user_response_checker(user, User.last)
  end
end
