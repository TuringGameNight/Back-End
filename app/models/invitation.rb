# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :game_night

  validates :user_id, presence: true
  validates :game_night_id, presence: true
  validates :status, presence: true

  def self.find_update(invitation_params)
    invite = Invitation.find_by(id: invitation_params[:id])
    invite.status = invitation_params[:status]
    invite.save
  end
end
