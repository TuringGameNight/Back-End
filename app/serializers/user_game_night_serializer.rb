# frozen_string_literal: true

class UserGameNightSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :number_of_games
end
