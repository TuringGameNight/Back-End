class Api::V1::Users::GamesController < ApplicationController

  def create
  game = Game.create(create_game_params)
  end

  private

  def create_game_params
    params.permit(:name, :game_type, :num_players, :description, :age_range, :duration, :image, :user_id)
  end
end
