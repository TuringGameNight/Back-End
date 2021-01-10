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
      expect(game).to have_key(:id)
      expect(game[:id]).to be_an(String)
      expect(game[:attributes]).to have_key(:name)
      expect(game[:attributes][:name]).to be_a(String)
      expect(game[:attributes]).to have_key(:game_type)
      expect(game[:attributes][:game_type]).to be_a(String)
      expect(game[:attributes]).to have_key(:description)
      expect(game[:attributes][:description]).to be_a(String)
      expect(game[:attributes]).to have_key(:duration)
      expect(game[:attributes][:duration]).to be_a(Integer)
      expect(game[:attributes]).to have_key(:image)
      expect(game[:attributes][:image]).to be_a(String)
      expect(game[:attributes]).to have_key(:num_players)
      expect(game[:attributes][:num_players]).to be_a(String)
      expect(game[:attributes]).to have_key(:age_range)
      expect(game[:attributes][:age_range]).to be_a(Integer)
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
        expect(game[:attributes]).to have_key(:name)
        expect(game[:attributes][:name]).to be_a(String)
        expect(game[:attributes]).to have_key(:game_type)
        expect(game[:game_type]).to be_a(String) if game[:game_type]
        expect(game[:attributes]).to have_key(:description)
        expect(game[:attributes][:description]).to be_a(String)
        expect(game[:attributes]).to have_key(:duration)
        expect(game[:attributes][:duration]).to be_a(Integer) if game[:attributes][:duration]
        expect(game[:attributes]).to have_key(:image)
        expect(game[:attributes][:image]).to be_a(String)
        expect(game[:attributes]).to have_key(:num_players)
        expect(game[:attributes][:num_players]).to be_a(String) if game[:attributes][:num_players]
        expect(game[:attributes]).to have_key(:age_range)
        expect(game[:attributes][:age_range]).to be_a(String) if game[:attributes][:age_range]
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
