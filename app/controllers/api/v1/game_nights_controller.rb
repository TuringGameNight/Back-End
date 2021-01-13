# frozen_string_literal: true

module Api
  module V1
    class GameNightsController < ApplicationController
      def show
        game_night = GameNight.find(params[:id])
        render json: GameNightSerializer.new(game_night)
      end

      def create
        game_night = GameNight.new(game_night_params)
        if game_night.save && params[:friends].count.positive?
          params[:friends].each do |friend_id|
            Invitation.create!(game_night_id: game_night.id, user_id: friend_id, status: 'pending')
          end
          render json: { message: 'success' }, status: :created
        else
          render json: { message: 'unsuccessful', error: 'Could not create game night' }, status: :unprocessable_entity
        end
      end

      private

      def game_night_params
        params.permit(:name, :user_id, :date, :number_of_games)
      end
    end
  end
end
