class Api::V1::GameNightsController < ApplicationController
  def show
    game_night = GameNight.find(params[:id])

    render json: GameNightSerializer.new(game_night)
  end

  def create
    json = JSON.parse(request.body.string, symbolize_names: true)

    game_night = GameNight.new(user_id: json[:user_id],
                               date: json[:date],
                               number_of_games: json[:number_of_games],
                               name: json[:name])
    json[:friends].delete_at(0)

    if game_night.save && json[:friends].count.positive?
      json[:friends].each do |friend_id|
        Invitation.create!(game_night_id: game_night.id, user_id: friend_id, status: 'pending')
      end

      render json: { message: 'success' }, status: :created
    else
      render json: { message: 'unsuccessful', error: game_night.errors.full_messages.to_sentence.to_s },
             status: :unprocessable_entity
    end
  end

  def update
    game_night = GameNight.find(params[:id])

    if game_night.update(update_params)
      render json: { message: 'success' }
    else
      render json: { message: 'unsuccessful', error: game_night.errors.full_messages.to_sentence.to_s },
             status: :unprocessable_entity
    end
  end

  def destroy
    game_night = GameNight.find(params[:id])
    game_night.destroy

    render json: { message: 'success' }
  end

  private

  def update_params
    JSON.parse(request.body.string, symbolize_names: true)
  end
end
