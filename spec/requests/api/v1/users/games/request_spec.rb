# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Users/Games/Request', type: :request do
  describe 'GET /users/games' do
    context 'when passed a user_id of a user with games' do
      it 'returns a list of user games' do
        user = create(:user)
        game1 = create(:game)
        game2 = create(:game)
        game3 = create(:game)
        create(:user_game, user: user, game: game1)
        create(:user_game, user: user, game: game2)
        create(:user_game, user: user, game: game3)

        get api_v1_user_games_path(user.id)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_body).to be_a(Hash)
        expect(json_body).to have_key(:data)
        expect(json_body[:data]).to be_a(Array)
        expect(json_body[:data].count).to eq(3)
        expect(json_body[:data][0][:attributes]).to be_a(Hash)

        json_body[:data].each do |item|
          expect(item[:attributes]).to have_key(:name)
          expect(item[:attributes][:name]).to be_a(String)

          expect(item[:attributes]).to have_key(:game_type)
          expect(item[:attributes][:game_type]).to be_a(String)

          expect(item[:attributes]).to have_key(:description)
          expect(item[:attributes][:description]).to be_a(String)

          expect(item[:attributes]).to have_key(:duration)
          expect(item[:attributes][:duration]).to be_a(Integer)

          expect(item[:attributes]).to have_key(:image)
          expect(item[:attributes][:image]).to be_a(String)

          expect(item[:attributes]).to have_key(:num_players)
          expect(item[:attributes][:num_players]).to be_a(String)

          expect(item[:attributes]).to have_key(:age_range)
          expect(item[:attributes][:age_range]).to be_a(String)
        end
      end
    end

    context 'when passed a user_id of a user with no games' do
      it 'returns an empty list' do
        user = create(:user)

        get api_v1_user_games_path(user.id)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_body).to be_a(Hash)
        expect(json_body).to have_key(:data)
        expect(json_body[:data]).to be_a(Array)
        expect(json_body[:data]).to be_empty
      end
    end

    context 'when passed a user_id that does not exist' do
      it 'returns a 404' do
        get api_v1_user_games_path(80000)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(json_body).to be_a(Hash)
        expect(json_body).to have_key(:message)
        expect(json_body[:message]).to eq('unsuccessful')
        expect(json_body).to have_key(:error)
        expect(json_body[:error]).to eq("Couldn't find User with 'id'=80000")
      end
    end
  end

  describe 'POST /users/games' do
    context 'when the game exists' do
      it 'creates a user_game record' do
        user = create(:user)
        game = create(:game)

        expect(User.all.first.games).to eq([])
        post api_v1_user_games_path(user.id), params: { name: game.name }

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(json_body[:message]).to eq('success')
        expect(User.all.first.games).to eq([game])
      end
    end

    context 'when the game does not exist' do
      it 'creates a user_game record' do
        user = create(:user)

        expect(User.all.first.games).to eq([])
        expect(Game.all).to eq([])

        post api_v1_user_games_path(user.id), params: {
          name: 'clue',
          description: 'The best game',
          duration: 90
        }

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(json_body[:message]).to eq('success')
        game = Game.all.first
        expect(User.all.first.games).to eq([game])
      end
    end

    context 'when a game can not be created' do
      it 'returns a 404' do
        user = create(:user)

        post api_v1_user_games_path(user.id), params: {
          name: 'clue'
        }

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(json_body[:message]).to eq('unsuccessful')
        expect(json_body[:error]).to eq("Validation failed: Description can't be blank, Duration can't be blank")
      end
    end
  end

  describe 'DELETE /users/games' do
    context 'when the game exists' do
      it 'can delete a game from user shelf' do
        user = create(:user)
        game = create(:game)
        user_game = UserGame.create!(user_id: user.id, game_id: game.id)

        expect(UserGame.all.first).to eq(user_game)

        delete api_v1_user_games_path(user.id), params: { game_id: game.id }

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(json_body[:message]).to eq('success')
        expect(UserGame.all).to eq([])
      end
    end

    context 'when the delete is unsuccessful' do
      it 'returns unsuccessful flash from json error' do
        user = create(:user)

        delete api_v1_user_games_path(user.id)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(json_body[:message]).to eq('unsuccessful')
        expect(json_body[:error]).to eq("Couldn't find UserGame")
      end
    end
  end
end
