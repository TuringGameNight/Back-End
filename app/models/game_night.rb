# frozen_string_literal: true

class GameNight < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true

  def confirmed_attendees
    User
      .joins(:invitations)
      .where(invitations: { game_night_id: id, status: 'accepted' }) +
      User
      .joins(:game_nights)
      .where(game_nights: { id: id })
  end

  def pending_attendees
    User
      .joins(:invitations)
      .where(invitations: { game_night_id: id, status: 'pending' })
  end

  def games_to_play
    users = confirmed_attendees.map { |user| user.id }
    Game.joins(:users).where(User.arel_table[:id].in(users)).distinct
  end
end
