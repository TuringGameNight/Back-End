module Api
  module V1
    class InvitationsController < ApplicationController

      def update
        Invitation.update(invitation_params)
        render json: { message: 'success' }, status: :accepted
      end

      private

      def invitation_params
        params.permit(:id, :user_id, :game_night_id, :status)
      end
    end
  end
end
