require 'rails_helper'

RSpec.describe 'GET Game Night' do
  it 'gets the data about a game night' do
    user_1 = create :user
    user_2 = create :user

    Friend.create(user_id: user_1.id, bud_id: user_2.id)
    Friend.create(user_id: user_2.id, bud_id: user_1.id)

    game_1 = create :game
    game_2 = create :game

    UserGame.create(user_id: user_1.id, game_id: game_1.id)
    UserGame.create(user_id: user_2.id, game_id: game_2.id)

    game_night = GameNight.create!(
      user_id: user_1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    Invitation.create!(
      status: 'pending',
      user_id: user_2.id,
      game_night_id: game_night.id
    )

    get "/api/v1/game_nights/#{game_night.id}"

    game_night_data = JSON.parse(response.body, symbolize_names: true)

    expect(game_night_data[:data]).to have_key(:id)
    expect(game_night_data[:data][:id]).to be_an(String)

    expect(game_night_data[:data][:attributes]).to have_key(:name)
    expect(game_night_data[:data][:attributes][:name]).to be_an(String)
    expect(game_night_data[:data][:attributes][:name]).to eq(game_night.name)

    expect(game_night_data[:data][:attributes]).to have_key(:date)
    expect(game_night_data[:data][:attributes][:date]).to be_an(String)
    expect(game_night_data[:data][:attributes][:date]).to eq(game_night.date)

    expect(game_night_data[:data][:attributes]).to have_key(:number_of_games)
    expect(game_night_data[:data][:attributes][:number_of_games]).to be_an(Integer)
    expect(game_night_data[:data][:attributes][:number_of_games]).to eq(game_night.number_of_games)

    expect(game_night_data[:data][:attributes]).to have_key(:games)
    expect(game_night_data[:data][:attributes][:games].count).to eq(2)

    expect(game_night_data[:data][:attributes]).to have_key(:attendees)
    expect(game_night_data[:data][:attributes][:attendees].count).to eq(2)
  end
end
