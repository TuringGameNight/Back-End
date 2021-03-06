# frozen_string_literal: true

module Api
  module V1
    class InvitationsController < ApplicationController
      def update
        invitation_params = JSON.parse(request.body.read, symbolize_names: true)
        Invitation.find_update(invitation_params)
        if Invitation.find_by(id: invitation_params[:id].to_i).status == 'pending'
          render json: { message: 'unsuccessful', error: 'Could not update invitation status' },
                 status: :unprocessable_entity
        else
          render json: { message: 'success' }, status: :accepted
        end
      end

      private

      def invitation_params
        params.permit(:id, :user_id, :game_night_id, :status)
      end
    end
  end
end
