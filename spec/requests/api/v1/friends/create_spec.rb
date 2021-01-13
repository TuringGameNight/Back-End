require 'rails_helper'

describe 'Friends endpoint', type: :request do
  it 'can create a friend' do
    user_1 = create(:user)
    user_2 = create(:user)

    request = {
      user_id: user_1.id,
      friend_email: user_2.email
    }

    post api_v1_user_friends_path(request)

    friends = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(friend[:attributes][:pending_friends][0][:name]).to eq(user_2.name)
    expect(friend[:attributes][:pending_friends][0][:id]).to eq(user_2.name)
    expect(friend[:attributes][:pending_friends][0][:email]).to eq(user_2.name)
  end

  it 'does not create a friendship if that user is not in the database' do
    user_1 = create(:user)
    friend_email = 'test@example.com'

    request = {
      user_id: user_1.id,
      friend_email: friend_email
    }

    post api_v1_user_friends_path(request)

    friends = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(friends).to eq([])
  end

  it 'does not create a friendship if the user tries to friend themselves' do
    user_1 = create(:user)

    request = {
      user_id: user_1.id,
      friend_email: user_1.email
    }

    post api_v1_user_friends_path(request)

    friends = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(friends).to eq([])
  end
end
