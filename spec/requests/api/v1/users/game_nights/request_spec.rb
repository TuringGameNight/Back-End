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

        expect(json_body[:message]).to eq('success')
        require "pry"; binding.pry
      end
    end

    context 'when there are no games' do
      xit 'the response is empty' do

      end
    end

    context 'when the user does not exist' do
      xit 'returns a 404' do

      end
    end
  end
end
