# frozen_string_literal: true

require 'rails_helper'

describe 'Add game endpoint', type: :request do
  it 'Allows user to add a game not discovered by the API' do
    user = create(:user)

    post api_v1_games_path, params: {
      user_id: user.id,
      name: 'DnD',
      game_type: 'Dice',
      num_players: '4-8',
      description: 'Fun times!',
      age_range: '10',
      duration: 2,
      image: 'N/A'
    }

    expect(Game.last.name).to eq('DnD')
    expect(UserGame.last.user_id).to eq(user.id)
    expect(UserGame.last.game_id).to eq(Game.last.id)

    post api_v1_games_path, params: {
      user_id: user.id,
      name: 'Catan',
      game_type: 'Board',
      num_players: '4-8',
      description: 'Fun times!',
      age_range: '10',
      duration: 2,
      image: 'N/A'
    }

    expect(Game.last.name).to eq('Catan')
    expect(UserGame.last.user_id).to eq(user.id)
    expect(UserGame.last.game_id).to eq(Game.last.id)
  end
end
