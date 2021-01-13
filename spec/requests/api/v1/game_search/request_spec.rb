# frozen_string_literal: true

require 'rails_helper'

describe 'searches for a game before hitting the API', type: :request do
  it 'peeks into the DB first' do
    chess = Game.create!(name: 'Chess',
                         game_type: 'Board/Strategy',
                         description: 'Timeless',
                         duration: 15,
                         image: 'Knight',
                         num_players: '2',
                         age_range: 6)

    get "/api/v1/games/find?name=#{chess.name}"

    expect(response.status).to eq(200)

    games = JSON.parse(response.body, symbolize_names: true)[:data]
    games.each do |game|
      game_search_response_checker(game, chess)
    end
  end

  it 'then calls to the API if game was not found' do
    random_game = 'Pandemic'
    headers = { 'CONTENT_TYPE' => 'application/json' }
    VCR.use_cassette('pandemic_game_search') do
      get "/api/v1/games/find?name=#{random_game}", headers: headers

      expect(response.status).to eq(200)
      games = JSON.parse(response.body, symbolize_names: true)[:data]
      games.each do |game|
        game_sinatra_response_checker(game)
      end
    end
  end

  it 'If the search has no results, the response is empty' do
    VCR.use_cassette('empty_game_search') do
      get '/api/v1/games/find?name=jfdueis', headers: headers

      expect(response.status).to eq(200)
      games = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(games).to eq([])
    end
  end
end
