# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/users/game_nights/request', type: :request do
  describe 'GET /users/:id/game_nights' do
    context 'when the user has game nights as a host or attendee' do
      it 'returns a list of the game nights' do
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

        game_night_2 = GameNight.create!(
          user_id: user_2.id,
          name: 'Thursday Fun Night',
          date: '2/15/2021',
          number_of_games: 2
        )

        Invitation.create!(
          status: 'pending',
          user_id: user_1.id,
          game_night_id: game_night_2.id
        )

        get api_v1_user_game_nights_path(user_1)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_body[:data].count).to eq(2)
        user_game_nights_response_checker(json_body, game_night_2)
      end
    end

    context 'when there are no games' do
      it 'the response is empty' do
        user_1 = create :user
        user_2 = create :user

        game_night = GameNight.create!(
          user_id: user_2.id,
          name: 'Friday Fun Night',
          date: '1/15/2021',
          number_of_games: 2
        )

        get api_v1_user_game_nights_path(user_1)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_body[:data].count).to eq(0)
      end
    end

    context 'when the user does not exist' do
      it 'returns a 404' do
        get api_v1_user_game_nights_path(3)

        json_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
      end
    end
  end
end
