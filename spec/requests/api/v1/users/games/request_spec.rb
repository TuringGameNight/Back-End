# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api/V1/Users/Games/Request', type: :request do
  describe 'POST /users/games' do
    context 'when a user adds a game' do
      it 'creates a user_game record' do
        user = create(:user)
        game = create(:game)

        post api_v1_users_games_path, params: { user_id: user.id, game_atlas_id: game.atlas_id }
      end
    end
  end
end
