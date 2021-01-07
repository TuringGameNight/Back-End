class Game < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :game_type, presence: true
  validates :description, presence: true
  validates :age_range, presence: true
  validates :duration, presence: true
  validates :user_id, presence: true
  validates :num_players, presence: true
end
