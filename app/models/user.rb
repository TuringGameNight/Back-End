# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :name, :email, presence: { require: true }
  validates :google_id, :auth_token, :token_expiration, presence: { require: true }

  has_many :game_nights, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :buds, through: :friends
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games

  def self.find_or_create(user_data)
    User.find_by(google_id: user_data[:uid]) || User.new(
      google_id: user_data[:uid],
      email: user_data[:info][:email],
      name: user_data[:info][:name],
      image: user_data[:info][:image],
      auth_token: user_data[:credentials][:token],
      refresh_token: user_data[:credentials][:refresh_token],
      token_expiration: user_data[:credentials][:expires_at]
    )
  end

  def get_game_nights
    attendee_gns = GameNight.joins(:invitations).where(invitations: { user_id: id })
    attendee_gns + game_nights
  end

  def get_accepted_buds
    bud_ids = User.joins(:friends)
                  .where("friends.user_id": id,
                         "friends.status": 'accepted')
                  .pluck('friends.bud_id')

    bud_ids.map do |bud_id|
      User.find(bud_id)
    end
  end

  def get_pending_buds
    bud_ids = User.joins(:friends)
                  .where("friends.user_id": id,
                         "friends.status": 'pending')
                  .pluck('friends.bud_id')

    bud_ids.map do |bud_id|
      User.find(bud_id)
    end
  end
end
