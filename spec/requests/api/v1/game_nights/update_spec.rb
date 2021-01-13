# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Game Night' do
  it 'can update a game_night' do
    game_night = create(:game_night, name: 'cool', date: 'never', number_of_games: 2)

    game_night_params = {
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 4
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    expect(GameNight.all.first.name).to eq('cool')
    expect(GameNight.all.first.date).to eq('never')
    expect(GameNight.all.first.number_of_games).to eq(2)

    patch api_v1_game_night_path(game_night.id), headers: headers, params: JSON.generate(game_night_params)

    expect(GameNight.all.first.name).to eq('Friday Fun Night')
    expect(GameNight.all.first.date).to eq('1/15/2021')
    expect(GameNight.all.first.number_of_games).to eq(4)
  end

  it 'returns json error if unsuccessful' do
    game_night_params = {
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 4
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch api_v1_game_night_path(80_000), headers: headers, params: JSON.generate(game_night_params)

    json_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(json_body).to have_key(:message)
    expect(json_body[:message]).to eq('unsuccessful')
    expect(json_body).to have_key(:error)
    expect(json_body[:error]).to eq("Couldn't find GameNight with 'id'=80000")
  end
end
