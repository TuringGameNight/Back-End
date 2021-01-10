# frozen_string_literal: true

module Api
  module V1
    module Users
      class GamesController < ApplicationController
        def create
          game = Game.find_by(name: game_params[:name])

          if game
            UserGame.create!(user_id: params[:user_id], game_id: game.id)
            render json: { message: 'success' }
          else
            new_game = Game.create!(game_params)
            UserGame.create!(user_id: params[:user_id], game_id: new_game.id)
            render json: { message: 'success' }
          end
        end

        private

        def game_params
          params.permit(:name, :description, :duration, :image, :game_type, :age_range, :num_players)
        end
      end
    end
  end
end
