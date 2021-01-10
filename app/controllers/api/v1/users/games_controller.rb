# frozen_string_literal: true

module Api
  module V1
    module Users
      class GamesController < ApplicationController
        def create
          game = Game.find_or_create_by!(atlas_id: user_game_params[:game_atlas_id])
        end

        private

        def user_game_params
          params.permit(:user_id, :game_atlas_id)
        end
      end
    end
  end
end
