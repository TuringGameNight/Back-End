require 'rails_helper'

describe 'Friend request accept', type: :request do
  it 'Can receive request to accept a friend invitation' do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)

    friendship = Friend.create!(user_id: user_1.id, bud_id: user_2.id)
    friendship_2 = Friend.create!(user_id: user_1.id, bud_id: user_3.id)

    expect(Friend.last.status).to eq('pending')

    get api_v1_user_friends_path(user_1.id)
    expect(response).to be_successful

    friends_data = JSON.parse(response.body, symbolize_names: true)
    friend_id = friends_data[:data][:attributes][:pending_friends][0][:id]
    pending_friend = ({
                      user_id: user_1.id,
                      friend_id: user_2.id,
                      status: "accepted"
                     })

    patch "/api/v1/users/#{user_1.id}/friends/#{friend_id}", headers: headers, params: JSON.generate(pending_friend)

    friends_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(friends_data[:data][:attributes][:accepted_friends][0][:name]).to eq(user_2.name)
    expect(friends_data[:data][:attributes][:accepted_friends][0][:id]).to eq(user_2.id)
    expect(friends_data[:data][:attributes][:accepted_friends][0][:email]).to eq(user_2.email)
    expect(friends_data[:data][:attributes][:accepted_friends][0][:name]).to eq(user_3.name)
    expect(friends_data[:data][:attributes][:accepted_friends][0][:id]).to eq(user_3.id)
    expect(friends_data[:data][:attributes][:accepted_friends][0][:email]).to eq(user_3.email)
  end
end
