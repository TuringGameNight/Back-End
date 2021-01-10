# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Users/Games/Request', type: :request do
  describe 'POST /users/games' do
    context 'when the game exists' do
      it 'creates a user_game record' do
        user = create(:user)
        game = create(:game)

        expect(User.all.first.games).to eq([])
        post api_v1_users_games_path, params: { user_id: user.id, name: game.name }

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

        post api_v1_users_games_path, params: {
          user_id: user.id,
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

        post api_v1_users_games_path, params: {
          user_id: user.id,
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

        delete api_v1_users_games_path, params: {
          user_id: user.id,
          game_id: game.id
        }

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(json_body[:message]).to eq('success')
        expect(UserGame.all).to eq([])
      end
    end

    context 'when the delete is unsuccessful' do
      it 'returns unsuccessful flash from json error' do
        delete api_v1_users_games_path

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(json_body[:message]).to eq('unsuccessful')
        expect(json_body[:error]).to eq("Couldn't find UserGame")
      end
    end
  end
end
