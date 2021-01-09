# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :image
  has_many :buds, through: :friends
  has_many :games, through: :user_games
end
