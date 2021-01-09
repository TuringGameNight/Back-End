# frozen_string_literal: true

require 'rails_helper'

describe 'Friends endpoint', type: :request do
  it 'sends all friends data for a particular user' do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)
    Friend.create(user_id: user_1.id, bud_id: user_2.id)
    Friend.create(user_id: user_1.id, bud_id: user_3.id)

    get api_v1_user_friends_path(user_1.id)

    expect(response).to be_successful

    friends = JSON.parse(response.body, symbolize_names: true)[:data]
    friends.each do |friend|
      expect(friend).to have_key(:id)
      expect(friend[:id]).to be_an(String)
      expect(friend[:attributes]).to have_key(:name)
      expect(friend[:attributes][:name]).to be_a(String)
      expect(friend[:attributes]).to have_key(:email)
      expect(friend[:attributes][:email]).to be_a(String)
    end
  end

  it 'cannot return friends if there are none' do
    user_1 = create(:user)
    get api_v1_user_friends_path(user_1.id)
    expect(response).to be_successful

    friends = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(friends).to eq([])
  end
end
