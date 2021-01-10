# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Users/Games/Request', type: :request do
  describe 'POST /users/games' do
    context 'when the game exists' do
      it 'creates a user_game record' do
        user = create(:user)
        game = create(:game)

        expect(User.all.first.games).to eq([])
        post api_v1_users_games_path, params: { user_id: user.id, game_atlas_id: game.atlas_id }

        expect(User.all.first.games).to eq([game])
      end
    end

    context 'when the game does not exist' do
      it 'creates a user_game record' do
        user = create(:user)

        expect(User.all.first.games).to eq([])
        post api_v1_users_games_path, params: { user_id: user.id, game_atlas_id: 'WVgc4bUL8N' }
      end
    end
  end
end
