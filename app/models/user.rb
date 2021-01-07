class User < ApplicationRecord

  validates :email, uniqueness: true
  validates :name, :email, presence: { require: true }
  validates :google_id, :google_token, :refresh_token, :auth_token, presence: { require: true }

  has_many :game_nights, dependent: :destroy
  has_many :invitations
  has_many :friends, dependent: :destroy
  has_many :buds, through: :friends
  has_many :games
end
