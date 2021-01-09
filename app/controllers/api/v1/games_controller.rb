class Api::V1::GamesController < ApplicationController

  def create
  game = Game.create(create_game_params)
  binding.pry
  render json: GamesSerializer.new(game)
  end

  private

  def create_game_params
    params.permit(:name, :game_type, :num_players, :description, :age_range, :duration, :image)
  end
end
