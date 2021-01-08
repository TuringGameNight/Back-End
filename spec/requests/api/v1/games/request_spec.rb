require 'rails_helper'

describe 'Add game endpoint', type: :request do
  it 'Allows user to add a game not discovered by the API' do
    user_1 = create(:user)

    post api_v1_user_games_path(user_1.id), params: {name: 'DnD',
                                                     game_type: "Dice",
                                                     num_players: "4-8",
                                                     description: "Fun times!",
                                                     age_range: "10",
                                                     duration: 2,
                                                     image: "N/A",
                                                     user_id: user_1.id}

    expect(Game.last.name).to eq('DnD')

    post api_v1_user_games_path(user_1.id), params: {name: 'Catan',
                                                     game_type: "Board",
                                                     num_players: "4-8",
                                                     description: "Fun times!",
                                                     age_range: "10",
                                                     duration: 2,
                                                     image: "N/A",
                                                     user_id: user_1.id}
    expect(Game.last.name).to eq('Catan')
  end
end
