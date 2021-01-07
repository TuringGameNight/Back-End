class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :game_night

  validates :user_id, presence: true
  validates :game_night_id, presence: true
  validates :status, presence: true
end
