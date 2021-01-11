# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true

  def self.find_game_db(game_name)
    # KT - changed to be exact so that if it's not exactly what they searched for, it triggers the API search
    Game.where('lower(name) = ?', game_name.downcase)
  end
end
