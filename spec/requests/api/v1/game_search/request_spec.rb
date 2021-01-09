require 'rails_helper'

describe 'searches for a game before hitting the API', type: :request do
  it 'peeks into the DB first' do
    chess = Game.create!(name: 'Chess',
                         game_type: 'Board/Strategy',
                         description: 'Timeless',
                         duration: 15,
                         image: 'Knight',
                         num_players: "2",
                         age_range: 6)

    get api_v1_games_find_path(chess.name)

    expect(response).to be_successful

    games = JSON.parse(response.body, symbolize_names: true)[:data]
    games.each do |games|
      expect(games).to have_key(:id)
      expect(games[:id]).to be_an(String)
      expect(games[:attributes]).to have_key(:name)
      expect(games[:attributes][:name]).to be_a(String)
      expect(games[:attributes]).to have_key(:game_type)
      expect(games[:attributes][:game_type]).to be_a(String)
      expect(games[:attributes]).to have_key(:description)
      expect(games[:attributes][:description]).to be_a(String)
      expect(games[:attributes]).to have_key(:duration)
      expect(games[:attributes][:duration]).to be_a(Integer)
      expect(games[:attributes]).to have_key(:image)
      expect(games[:attributes][:image]).to be_a(String)
      expect(games[:attributes]).to have_key(:num_players)
      expect(games[:attributes][:num_players]).to be_a(String)
      expect(games[:attributes]).to have_key(:age_range)
      expect(games[:attributes][:age_range]).to be_a(Integer)
    end
  end

  it 'then calls to the API if game was not found' do
    random_game = "War"

    get api_v1_games_find_path(random_game)

    expect(response.status).to eq(204)
  end
end
