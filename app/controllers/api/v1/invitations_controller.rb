# frozen_string_literal: true

module Api
  module V1
    class InvitationsController < ApplicationController
      def update
        Invitation.update(invitation_params)
        unless Invitation.find_by(id: invitation_params[:id].to_i).status == 'pending'
          render json: { message: 'success' }, status: :accepted
        else
          render json: { message: 'unsuccessful', error: 'Could not update invitation status' }, status: :unprocessable_entity
        end
      end

      private

      def invitation_params
        params.permit(:id, :user_id, :game_night_id, :status)
      end
    end
  end
end
