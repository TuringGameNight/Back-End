class Api::V1::Games::FindController < ApplicationController

  def index
    game_name = params[:format]
    if find_game_db(game_name).empty?
      p 'do the sinatra api call'
    else
    render json: GamesSerializer.new(find_game_db(game_name))
    end
  end

  private

  
end
