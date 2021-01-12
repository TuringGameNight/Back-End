require 'rails_helper'

describe 'Friend request accept/decline', type: :request do
  it 'Can receive request with option to accept or decline request' do
    user_1 = create(:user)
    user_2 = create(:user)

    friend = Friend.create!(user_id: user_1.id, bud_id: user_2.id)

    expect(Friend.last.status).to eq('pending')
  end
end
