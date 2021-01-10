class GameNight < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true

  def attendees
    # I welcome optimizations here. But this took a while to
    # realize that they needed to be separate.
    User
      .joins(:invitations)
      .where('invitations.game_night_id = ?', id) +
      User
      .joins(:game_nights)
      .where('game_nights.id = ?', id)
  end

  def games_to_play
    users = attendees.map { |user| user.id }
    Game.joins(:users).where(User.arel_table[:id].in(users)).distinct
  end
end
