require 'rails_helper'

describe 'Friend request accept/decline', type: :request do
  it 'Can receive request with option to accept or decline request' do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)

    friendship = Friend.create!(user_id: user_1.id, bud_id: user_2.id)
    friendship_2 = Friend.create!(user_id: user_1.id, bud_id: user_3.id)

    expect(Friend.last.status).to eq('pending')

    get api_v1_user_friends_path(user_1.id)

    expect(response).to be_successful

    friends_data = JSON.parse(response.body, symbolize_names: true)
    friends = friends_data[:data].first
    friends[:attributes][:status] = "accepted"

    patch "/api/v1/users/#{user_1.id}/friends/#{friends[:id]}", headers: headers, params: JSON.generate(friends)

    friends_data = JSON.parse(response.body, symbolize_names: true)
    friends = friends_data[:data].first

    expect(response).to be_successful
    expect(friends[:status]).to eq('accepted')
  end
end
