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

    gamenight = GameNight.create!(
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    Invitation.create!(
      status: 'accepted',
      user_id: user2.id,
      game_night_id: gamenight.id
    )
    Invitation.create!(
      status: 'pending',
      user_id: user3.id,
      game_night_id: gamenight.id
    )

    get "/api/v1/game_nights/#{gamenight.id}"

    gamenightdata = JSON.parse(response.body, symbolize_names: true)

    expect(gamenightdata[:data]).to have_key(:id)
    expect(gamenightdata[:data][:id]).to be_an(String)

    expect(gamenightdata[:data][:attributes]).to have_key(:name)
    expect(gamenightdata[:data][:attributes][:name]).to be_an(String)
    expect(gamenightdata[:data][:attributes][:name]).to eq(gamenight.name)

    expect(gamenightdata[:data][:attributes]).to have_key(:date)
    expect(gamenightdata[:data][:attributes][:date]).to be_an(String)
    expect(gamenightdata[:data][:attributes][:date]).to eq(gamenight.date)

    expect(gamenightdata[:data][:attributes]).to have_key(:number_of_games)
    expect(gamenightdata[:data][:attributes][:number_of_games]).to be_an(Integer)
    expect(gamenightdata[:data][:attributes][:number_of_games]).to eq(gamenight.number_of_games)

    expect(gamenightdata[:data][:attributes]).to have_key(:games)
    expect(gamenightdata[:data][:attributes][:games].count).to eq(2)

    expect(gamenightdata[:data][:attributes]).to have_key(:confirmed_attendees)
    expect(gamenightdata[:data][:attributes][:confirmed_attendees].count).to eq(2)

    expect(gamenightdata[:data][:attributes]).to have_key(:pending_attendees)
    expect(gamenightdata[:data][:attributes][:pending_attendees].count).to eq(1)
  end
end
