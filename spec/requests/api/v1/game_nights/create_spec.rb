require 'rails_helper'

RSpec.describe 'Create Game Night' do
  it "creates game night from request and responds with appropriate data" do
    user_1 = create :user
    user_2 = create :user

    Friend.create(user_id: user_1.id, bud_id: user_2.id)
    Friend.create(user_id: user_2.id, bud_id: user_1.id)

    game_1 = create :game
    game_2 = create :game

    UserGame.create(user_id: user_1.id, game_id: game_1.id)
    UserGame.create(user_id: user_2.id, game_id: game_2.id)

    game_night_params = {
      :user_id => user_1.id,
      :name => 'Friday Fun Night',
      :date => '1/15/2021',
      :number_of_games => 2
    }

    post '/api/v1/game_nights', headers: headers, params: JSON.generate(game_night_params)

    game_night = JSON.parse(response.body, symbolize_names: true)

    expect(game_night[:success]).to eq("game night created")
    expect(GameNight.last.name).to eq(game_night_params[:name])
    expect(GameNight.last.user_id).to eq(game_night_params[:user_id])
  end
end
