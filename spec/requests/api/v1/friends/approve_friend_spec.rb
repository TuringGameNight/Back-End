require 'rails_helper'

describe 'Friend request accept/decline', type: :request do
  it 'Can receive request with option to accept or decline request' do
    user_1 = create(:user)
    user_2 = create(:user)
    friendship = Friend.create!(user_id: user_1.id, bud_id: user_2.id)

    # input = {"data"=>[{"id"=>"#{user_1.id}", "type"=>"friends", "attributes"=>{"name"=>"Hades",
    #           "email"=>"idella@dubuque.org"}}], "controller"=>"
    #           api/v1/users/friends", "action"=>"update", "id"=>"#{user_2.id}", "status"=>"accepted"}

    expect(Friend.last.status).to eq('pending')

    get api_v1_user_friends_path(user_1.id)

    expect(response).to be_successful
    headers = {"CONTENT_TYPE" => "application/json"}
    friends_data = JSON.parse(response.body, symbolize_names: true)
    friends = friends_data[:data].first
    require "pry"
    binding.pry
    patch "/api/v1/users/#{user_1.id}/friends/#{friends[:id]}", headers: headers, params: friends_data

    friends_data = JSON.parse(response.body, symbolize_names: true)
    friends = friends_data[:data].first

    expect(response).to be_successful
    expect(friends[:status]).to eq('approved')
  end
end
