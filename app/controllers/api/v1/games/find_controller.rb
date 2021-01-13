# frozen_string_literal: true

module Api
  module V1
    module Games
      class FindController < ApplicationController
        def index
          game_name = params[:name]
          if Game.find_game_db(game_name).empty?
            render json: SearchFacade.find_games_by_name(game_name)
          else
            render json: GamesSerializer.new(Game.find_game_db(game_name))
          end
        end
      end
    end
  end
end
