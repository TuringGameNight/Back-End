class Api::V1::Games::FindController < ApplicationController

  def show
    if Game.where("lower(name) LIKE ?", "%" + params[:format].downcase + "%") == []
      p 'do the sinatra api call'
    else
    render json: GamesSerializer.new(
      Game.where("lower(name) LIKE ?", "%" + params[:format].downcase + "%"))
    end
  end
end
