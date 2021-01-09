class Api::V1::UsersController < ApplicationController
  def create
    user_params = JSON.parse(request.body.read, symbolize_names: true)

    user = User.find_or_create_by(google_id: user_params[:client_id],
       name: user_params[:user_data][:info][:name],
        image: user_params[:user_data][:info][:image],
         auth_token: user_params[:user_data][:credentials][:token],
          refresh_token: user_params[:user_data][:credentials][:refresh_token],
           google_token: user_params[:user_data][:extra][:id_token],
            email: user_params[:user_data][:info][:email])
    render json: UserSerializer.new(user)
  end

  private

  # def user_params
  #   params.permit()
  # end

end
