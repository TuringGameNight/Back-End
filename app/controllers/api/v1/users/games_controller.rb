# frozen_string_literal: true

module Api
  module V1
    module Users
      class GamesController < ApplicationController
        def create
           game = Game.find_by(atlas_id: params[:game_atlas_id])

          if game
            UserGame.create!(user_id: params[:user_id], game_id: game.id)
            # render json?
          else
            # call out to api?...think this doesn't need to happen
            # create user_game
            # render json?
          end
        end
      end
    end
  end
end
