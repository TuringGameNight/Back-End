require 'rails_helper'

describe 'Friends endpoint', type: :request do
  it 'can create a friend' do
    user_1 = create(:user)
    user_2 = create(:user)

    post "/api/v1/users/#{user_1.id}/friends", params: {
      user_id: user_1.id,
      friend_email: user_2.email
    }

    friends = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(friends[:attributes][:pending_friends][0][:name]).to eq(user_2.name)
    expect(friends[:attributes][:pending_friends][0][:id]).to eq(user_2.id)
    expect(friends[:attributes][:pending_friends][0][:email]).to eq(user_2.email)
  end

  it 'does not create a friendship if that user is not in the database' do
    user_1 = create(:user)
    friend_email = 'test@example.com'

    post "/api/v1/users/#{user_1.id}/friends", params: {
      user_id: user_1.id,
      friend_email: friend_email
    }

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:message]).to eq('unsuccessful')
  end

  it 'does not create a friendship if the user tries to friend themselves' do
    user_1 = create(:user)

    post "/api/v1/users/#{user_1.id}/friends", params: {
      user_id: user_1.id,
      friend_email: user_1.email
    }

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:message]).to eq('unsuccessful')
  end
end
