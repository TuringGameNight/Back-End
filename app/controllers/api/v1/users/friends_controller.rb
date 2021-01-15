# frozen_string_literal: true

module Api
  module V1
    module Users
      class FriendsController < ApplicationController
        def index
          user = User.find(params[:user_id])
          render json: FriendsSerializer.new(user)
        end

        def update
          friendship_params = JSON.parse(request.body.read, symbolize_names: true)
          render json: FriendsFacade.accept_friendship(friendship_params[:user_id], friendship_params[:friend_id])
        end

        def create
          friendship_params = JSON.parse(request.body.read, symbolize_names: true)
          render json: FriendsFacade.create_friendship(friendship_params[:user_id], friendship_params[:friend_email])
        end

        def destroy
          friendship = Friend.find_by(user_id: params[:user_id], bud_id: params[:id])
          friendship.delete
          render json: { message: 'success' }
        end
      end
    end
  end
end
