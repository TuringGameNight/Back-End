class Api::V1::GameNightsController < ApplicationController
  def show

  end

  def create
    game_night_params = JSON.parse(request.body.read, symbolize_names: true)
    #how can we do stronger params here?
    game_night = GameNight.new(game_night_params)
    if game_night.save
      render json: { success: 'game night created' }, status: :created
    else
      render json: { error: 'data cannot be blank' }, status: :unprocessable_entity
    end
  end
end
