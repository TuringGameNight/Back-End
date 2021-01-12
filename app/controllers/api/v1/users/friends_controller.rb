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
          friend = Friend.find_by(user_id: params["data"][0]["id"], bud_id: params["id"])
          friend.status = "accepted"
          friend.save
          results = User.joins(:friends).where("friends.user_id": params[:user_id]).select("users.name, users.email, friends.status")
          render json: FriendsSerializer.new(results)
        end
      end
    end
  end
end
