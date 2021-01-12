require 'rails_helper'

RSpec.describe 'GET Game Night' do
  it 'gets the data about a game night' do
    user1 = create :user
    user2 = create :user
    user3 = create :user

    Friend.create(user_id: user1.id, bud_id: user2.id)
    Friend.create(user_id: user2.id, bud_id: user1.id)
    Friend.create(user_id: user1.id, bud_id: user3.id)
    Friend.create(user_id: user3.id, bud_id: user1.id)

    game1 = create :game
    game2 = create :game

    UserGame.create(user_id: user1.id, game_id: game1.id)
    UserGame.create(user_id: user2.id, game_id: game2.id)

    game_night = GameNight.create!(
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    Invitation.create!(
      status: 'accepted',
      user_id: user2.id,
      game_night_id: game_night.id
    )
    Invitation.create!(
      status: 'pending',
      user_id: user3.id,
      game_night_id: game_night.id
    )

    get "/api/v1/game_nights/#{game_night.id}"

    game_night_data = JSON.parse(response.body, symbolize_names: true)

    game_night_show_response_checker(game_night_data, game_night, user1)
    expect(game_night_data[:data][:attributes][:games].count).to eq(2)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].count).to eq(2)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first[:data][:id]).to eq(user2.id.to_s)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first[:data][:attributes][:name]).to eq(user2.name)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first[:data][:attributes][:email]).to eq(user2.email)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].second[:data][:id]).to eq(user1.id.to_s)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].second[:data][:attributes][:name]).to eq(user1.name)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].second[:data][:attributes][:email]).to eq(user1.email)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first).not_to have_key(:google_token)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first).not_to have_key(:auth_token)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first).not_to have_key(:refresh_token)
    expect(game_night_data[:data][:attributes][:confirmed_attendees].first).not_to have_key(:google_id)
    expect(game_night_data[:data][:attributes][:pending_attendees].count).to eq(1)
    expect(game_night_data[:data][:attributes][:pending_attendees].first[:data][:id]).to eq(user3.id.to_s)
    expect(game_night_data[:data][:attributes][:pending_attendees].first[:data][:attributes][:name]).to eq(user3.name)
    expect(game_night_data[:data][:attributes][:pending_attendees].first[:data][:attributes][:email]).to eq(user3.email)
  end

  it 'gets the data about a game night that has no invitations' do
    user1 = create :user

    game1 = create :game

    UserGame.create(user_id: user1.id, game_id: game1.id)

    game_night = GameNight.create!(
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 1
    )

    get "/api/v1/game_nights/#{game_night.id}"

    game_night_data = JSON.parse(response.body, symbolize_names: true)

    game_night_show_response_checker(game_night_data, game_night, user1)
    expect(game_night_data[:data][:attributes][:games].count).to eq(1)
  end
end
