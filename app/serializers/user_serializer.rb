class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :image

  attribute :buds do |user|
    user.friends.each do |friend|
      friend
    end
  end

  attribute :games do |user|
    user.games.each do |game|
      game
    end
  end

  attribute :game_nights do |user|
    user.game_nights.each do |game_night|
      game_night
    end
  end
end
