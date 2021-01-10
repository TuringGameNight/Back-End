class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games

  validates :name, presence: true
  validates :game_type, presence: true
  validates :description, presence: true
  validates :age_range, presence: true
  validates :duration, presence: true
  validates :num_players, presence: true
end
