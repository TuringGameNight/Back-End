class GameNight < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true

  # def games_to_play
  #   Game.
  #   joins(users: [:invitations, :game_nights]).
  #   where('invitations.game_night_id = ? OR game_nights.id = ?', self.id, self.id).
  #   distinct
  #
  # end
  #
  # Game.
  # joins(users: [:invitations, :game_nights]).
  # where('invitations.game_night_id = ? OR game_nights.id = ?', self.id, self.id).
  # distinct
  # #
  # def method_name
  #   select games.* from games
  #   inner join user_games on games.id = user_games.game_id
  #   inner join users on user_games.user_id = user.id
  #   inner join invitations on invitations.user_id = user.id
  #   inner join game_nights on game_nights.user_id = user.id
  #   where invitations.game_night_id = self.id OR game_night.id = self.id
  # end

  # def attendee_games(users)
  #   games = []
  #   users.each do |user|
  #     games << user.games
  #   end
  #   games
  # end
end
