class Api::V1::UsersController < ApplicationController
  def create
    binding.pry
    user_params = JSON.parse(params, symbolize_names: true)
    user = User.find_or_create_by()
  end

  private

  # def user_params
  #   params.permit()
  # end

end
