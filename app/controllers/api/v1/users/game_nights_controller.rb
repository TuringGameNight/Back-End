# frozen_string_literal: true

module Api
  module V1
    module Users
      class GameNightsController < ApplicationController
        def index
          user = User.find(params[:user_id])
          render json: GameNightSerializer.new(user.get_game_nights)
        end
      end
    end
  end
end
