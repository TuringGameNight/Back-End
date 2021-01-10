# frozen_string_literal: true

module Api
  module V1
    module Users
      class FriendsController < ApplicationController
        def index
          user = User.find(params[:user_id])
          render json: FriendsSerializer.new(user.buds)
        end
      end
    end
  end
end
