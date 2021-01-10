# frozen_string_literal: true

class Game < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true

  def self.find_game_db(game_name)
    # KT - changed to be exact so that if it's not exactly what they searched for, it triggers the API search
    Game.where('lower(name) = ?', game_name.downcase)
  end
end
