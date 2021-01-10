class Api::V1::GameNightsController < ApplicationController
  def create
    game_night_params = JSON.parse(request.body.read, symbolize_names: true)
    game_night = GameNight.create(game_night_params)
    render json: UserSerializer.new(game_night)
  end
end
