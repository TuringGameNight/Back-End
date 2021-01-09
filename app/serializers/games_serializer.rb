# frozen_string_literal: true

class GamesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :game_type, :description, :duration, :image, :num_players, :age_range
end
