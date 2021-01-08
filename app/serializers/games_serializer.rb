class GamesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :game_type, :description, :duration, :image, :user_id, :num_players, :age_range
end
