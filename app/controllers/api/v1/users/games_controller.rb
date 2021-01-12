# frozen_string_literal: true

module Api
  module V1
    module Users
      class GamesController < ApplicationController
        def index
          user_games = User.find(params[:user_id]).games

          render json: GamesSerializer.new(user_games)
        end

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

        def destroy
          user_game = UserGame.find_by!(user_id: params[:user_id], game_id: params[:game_id])
          user_game.delete

          render json: { message: 'success' }
        end

        private

        def game_params
          params.permit(:name, :description, :duration, :image, :game_type, :age_range, :num_players)
        end
      end
    end
  end
end
