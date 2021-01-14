# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE User/Friends', type: :request do
  it 'can delete a friend' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    user4 = create(:user)

    friendship1 = create(:friend, user: user1, bud_id: user2.id)
    friendship2 = create(:friend, user: user1, bud_id: user3.id)
    friendship3 = create(:friend, user: user1, bud_id: user4.id)

    expect(Friend.all).to eq([friendship1, friendship2, friendship3])

    delete "/api/v1/users/#{user1.id}/friends/#{friendship1.id}"

    expect(Friend.all).to eq([friendship2, friendship3])
  end

  it 'returns json error when unsuccessful' do
    user1 = create(:user)

    delete "/api/v1/users/#{user1.id}/friends/#{80_000}"

    json_body = JSON.parse(response.body, symbolize_names: true)

    expect(json_body[:message]).to eq('unsuccessful')
    expect(json_body[:error]).to eq("Couldn't find Friend with 'id'=80000")

  end
end
