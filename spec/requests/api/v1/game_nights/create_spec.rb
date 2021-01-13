require 'rails_helper'

RSpec.describe 'Create Game Night' do
  it 'creates game night from request and responds with appropriate data' do
    user1 = create(:user, id: 200)
    user2 = create :user

    Friend.create(user_id: user1.id, bud_id: user2.id)
    Friend.create(user_id: user2.id, bud_id: user1.id)

    game1 = create :game
    game2 = create :game

    UserGame.create(user_id: user1.id, game_id: game1.id)
    UserGame.create(user_id: user2.id, game_id: game2.id)

    
    game_night_params = {
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2,
      friends: ["",user2.id.to_s]
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_game_nights_path,headers: headers, params: JSON.generate(game_night_params)

    json_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(json_body).to have_key(:message)
    expect(json_body[:message]).to eq('success')

    expect(GameNight.last.name).to eq(game_night_params[:name])
    expect(GameNight.last.user_id).to eq(game_night_params[:user_id])
    expect(Invitation.last.user_id).to eq(user2.id)
  end

  context 'when a game night can not be created' do
    it 'returns a json error' do
      user1 = create :user
      user2 = create :user

      Friend.create(user_id: user1.id, bud_id: user2.id)
      Friend.create(user_id: user2.id, bud_id: user1.id)

      game1 = create :game
      game2 = create :game

      UserGame.create(user_id: user1.id, game_id: game1.id)
      UserGame.create(user_id: user2.id, game_id: game2.id)

      game_night_params = {
        user_id: user1.id,
        name: 'Friday Fun Night',
        friends: [""]
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post api_v1_game_nights_path, params: JSON.generate(game_night_params)

      json_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(422)
      expect(json_body).to have_key(:message)
      expect(json_body[:message]).to eq('unsuccessful')
    end
  end
end
