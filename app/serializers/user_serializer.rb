class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :image, :google_token, :auth_token, :refresh_token, :google_id
  has_many :buds, through: :friends
  has_many :games, through: :user_games
end
