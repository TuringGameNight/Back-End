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
          render json: FriendsFacade.accept_friendship(params[:user_id], params[:friend_id])
        end

        def create
          render json: FriendsFacade.create_friendship(params[:id], params[:friend_email])
        end

        def destroy
          friendship = Friend.find(params[:id])
          friendship.delete

          render json: { message: 'success' }
        end
      end
    end
  end
end
