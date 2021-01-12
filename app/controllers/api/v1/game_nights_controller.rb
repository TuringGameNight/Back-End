class Api::V1::GameNightsController < ApplicationController
  def show
    game_night = GameNight.find(params[:id])
    render json: GameNightSerializer.new(game_night)
  end

  def create
    game_night_data = JSON.parse(request.body.read, symbolize_names: true)
    game_night_params = game_night_data.extract!(:name, :user_id, :date, :number_of_games)

    game_night = GameNight.new(game_night_params)

    if game_night.save && game_night_data[:friends].count > 0
      game_night_data[:friends].each do |friend_id|
        Invitation.create!(game_night_id: game_night.id, user_id: friend_id, status: 'pending')
      end
      render json: { success: 'game night created' }, status: :created
    else
      render json: { error: 'data cannot be blank' }, status: :unprocessable_entity
    end
  end
end
