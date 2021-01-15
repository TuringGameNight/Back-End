require 'rails_helper'

describe 'Friend request accept', type: :request do
  it 'Can receive request to accept a friend invitation' do
    user_1 = create(:user)
    user_2 = create(:user)

    friendship = Friend.create!(user_id: user_1.id, bud_id: user_2.id, status: 'pending')
    friendship = Friend.create!(user_id: user_2.id, bud_id: user_1.id, status: 'sent')


    expect(Friend.last.status).to eq('sent')
    expect(Friend.first.status).to eq('pending')

    get api_v1_user_friends_path(user_1.id)
    expect(response).to be_successful

    friends_data = JSON.parse(response.body, symbolize_names: true)

    friend_id = friends_data[:data][:attributes][:pending_friends][0][:id]

    pending_friend = {
      user_id: user_1.id,
      friend_id: user_2.id,
      status: 'accepted'
    }

    patch "/api/v1/users/#{user_1.id}/friends/#{friend_id}", params: {
      user_id: user_1.id,
      friend_id: user_2.id,
      status: 'accepted'
    }, as: :json

    friends_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(friends_data[:message]).to eq('successful')
  end
end
