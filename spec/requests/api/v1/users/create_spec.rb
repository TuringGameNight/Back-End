# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create User' do
  it 'responds with new user info if user does not exist in db' do
    user_params = { client_id: '101010',
                    user_data: { uid: '121212121',
                                 info: { name: 'Elon Musk',
                                         email: 'elonistheman@email.com',
                                         image: 'elonbeingcoolerthanyou.imgur.com' },
                                 credentials: { token: '0101010101',
                                                refresh_token: '1010101010101',
                                                expires_at: 123_123_123 } } }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    user_response_checker(user, User.last)
  end

  it 'responds with error message if lookup/creation for user failed' do
    user_params = { client_id: '101010',
                    user_data: { uid: '',
                                 info: { name: 'Elon Musk',
                                         email: 'elonistheman@email.com',
                                         image: 'elonbeingcoolerthanyou.imgur.com' },
                                 credentials: { token: '0101010101',
                                                refresh_token: '1010101010101',
                                                expires_at: 123_123_123 } } }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    error_response = JSON.parse(response.body, symbolize_names: true)
    expect(error_response[:message]).to eq('unsuccessful')
    expect(error_response[:error]).to eq('Could not find or create user')
    expect(response.status).to eq(422)
    expect(User.all.empty?).to be(true)
  end

  it 'responds with error message if lookup/creation for user failed' do
    user_params = { client_id: '101010',
                    user_data: { uid: '',
                                 info: { name: 'Elon Musk',
                                         email: 'elonistheman@email.com',
                                         image: 'elonbeingcoolerthanyou.imgur.com' },
                                 credentials: { token: '0101010101',
                                                refresh_token: '1010101010101',
                                                expires_at: 123_123_123 } } }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    error_response = JSON.parse(response.body, symbolize_names: true)
    expect(error_response[:message]).to eq('unsuccessful')
    expect(error_response[:error]).to eq('Could not find or create user')
    expect(response.status).to eq(422)
    expect(User.all.empty?).to be(true)
  end
end
