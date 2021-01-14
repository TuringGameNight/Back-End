# frozen_string_literal: true

module Api
  module V1
    module Users
      class InvitationsController < ApplicationController
        def index
          user = User.find_by(id: invitation_params[:user_id])
          invitations = user.get_pending_invitations
          render json: InvitationSerializer.new(invitations)
        end

        private

        def invitation_params
          params.permit(:user_id)
        end
      end
    end
  end
end
