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

    delete "/api/v1/users/#{user1.id}/friends/#{user2.id}"

    expect(Friend.all).to eq([friendship2, friendship3])
  end
end
