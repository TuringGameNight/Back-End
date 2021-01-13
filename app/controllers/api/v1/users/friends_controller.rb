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
          friend = Friend.find_by(user_id: params["user_id"], bud_id: params["friend_id"])
          friend.status = "accepted"
          friend.save

          user = User.find(params["user_id"])
          render json: FriendsSerializer.new(user)
        end

        def create
          user = User.find(params[:id])
          friend = User.find_by(email: params[:friend_email])

          Friend.create(user_id: user.id, bud_id: friend.id)

          render json: FriendsSerializer.new(user)
        end
      end
    end
  end
end
