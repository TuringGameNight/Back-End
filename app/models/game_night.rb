class GameNight < ApplicationRecord
  belongs_to :user
  has_many :invitations
  has_many :users, through: :invitations

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true

  def games_to_play
    (attendee_games(self.users) + self.user.games).uniq
  end

  def attendee_games(users)
    games = []
    users.each do |user|
      games << user.games
    end
    games
  end
end
