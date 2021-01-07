class Api::V1::Users::FriendsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: FriendsSerializer.new(user.buds)
  end
end
