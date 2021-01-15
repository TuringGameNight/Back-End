require 'rails_helper'

describe 'Friends endpoint', type: :request do
  it 'can create a friend' do
    user_1 = create(:user)
    user_2 = create(:user)

    post "/api/v1/users/#{user_1.id}/friends", params: {
      user_id: user_1.id,
      friend_email: user_2.email
    }, as: :json

    friend_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(friend_response[:message]).to eq('successful')
  end

  it 'does not create a friendship if that user is not in the database' do
    user_1 = create(:user)
    friend_email = 'test@example.com'

    post "/api/v1/users/#{user_1.id}/friends", params: {
      user_id: user_1.id,
      friend_email: friend_email
    }, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:message]).to eq('unsuccessful')
  end

  it 'does not create a friendship if the user tries to friend themselves' do
    user_1 = create(:user)

    post "/api/v1/users/#{user_1.id}/friends", params: {
      user_id: user_1.id,
      friend_email: user_1.email
    }, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:message]).to eq('unsuccessful')
  end
end
