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
          json = JSON.parse(request.body.string, symbolize_names: true)
          game = Game.find_by(name: json[:name])

          if game
            UserGame.create!(user_id: params[:user_id], game_id: game.id)
            render json: { message: 'success' }
          else

            new_game = Game.create!({ name: json[:name],
                                      description: json[:description],
                                      duration: json[:duration],
                                      image: json[:image],
                                      game_type: json[:game_type],
                                      age_range: json[:age_range],
                                      num_players: json[:num_players] })
            UserGame.create!(user_id: params[:user_id], game_id: new_game.id)
            render json: { message: 'success' }
          end
        end

        def destroy
          user_game = UserGame.find_by!(user_id: params[:user_id], game_id: params[:id])
          user_game.destroy

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
