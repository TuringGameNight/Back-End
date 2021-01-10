class GameNight < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :date, presence: true
  validates :number_of_games, presence: true
  validates :name, presence: true
end
