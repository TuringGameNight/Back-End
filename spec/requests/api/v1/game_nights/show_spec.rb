require 'rails_helper'

RSpec.describe 'GET Game Night' do
  it 'gets the data about a game night' do
    user_1 = create :user
    user_2 = create :user

    Friend.create(user_id: user_1.id, bud_id: user_2.id)
    Friend.create(user_id: user_2.id, bud_id: user_1.id)

    game_1 = create :game
    game_2 = create :game

    UserGame.create(user_id: user_1.id, game_id: game_1.id)
    UserGame.create(user_id: user_2.id, game_id: game_2.id)

    game_night = GameNight.create!(
      user_id: user_1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    Invitation.create!(
      status: 'pending',
      user_id: user_2.id,
      game_night_id: game_night.id
    )

    get "/api/v1/game_nights/#{game_night.id}"

    game_night_data = JSON.parse(response.body, symbolize_names: true)
    game_night_show_response_checker(game_night_data, game_night, user_2)
  end
end
