class GameNight < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true

  def games_to_play
    # I welcome optimizations here. But this took a WHILE.
    attendees = User.
                joins(:invitations).
                where('invitations.game_night_id = ?', self.id).
                pluck(:id)
    users = attendees + User.
                        joins(:game_nights).
                        where('game_nights.id = ?', self.id).
                        pluck(:id)
    Game.joins(:users).where(User.arel_table[:id].in(users)).distinct
  end
end
