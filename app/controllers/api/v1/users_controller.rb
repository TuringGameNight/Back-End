# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        user_params = JSON.parse(request.body.read, symbolize_names: true)
        user = User.find_or_update(user_params)
        render json: UserSerializer.new(user)
      end
    end
  end
end
