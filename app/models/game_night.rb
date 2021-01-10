class GameNight < ApplicationRecord
  belongs_to :user
  has_many :invitations
  has_many :users, through: :invitations

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true

  def games_to_play
    Game.joins(:user_games).where(user_games.user_id =
      User.joins(:invitations).joins(:game_nights).
      where('invitations.game_night_id = ? OR game_nights.id = ?', self.id, self.id)
    )

  end

  def method_name
    select games.* from games where
  end

  # def attendee_games(users)
  #   games = []
  #   users.each do |user|
  #     games << user.games
  #   end
  #   games
  # end
end
