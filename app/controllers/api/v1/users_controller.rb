# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        user_params = JSON.parse(request.body.read, symbolize_names: true)
        user = User.find_or_create(user_params[:user_data])
        if user.save
          render json: UserSerializer.new(user)
        else
          render json: { message: 'unsuccessful', error: 'Could not find or create user' },
                 status: :unprocessable_entity
        end
      end
    end
  end
end
