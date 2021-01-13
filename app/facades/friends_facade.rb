class FriendsFacade
  def self.create_friendship(user_id, friend_email)
    user = User.find(user_id)
    friend = User.find_by(email: friend_email)

    if friend != nil && user.id != friend.id
      Friend.create(user_id: user.id, bud_id: friend.id)
      FriendsSerializer.new(user)
    else
      { message: 'unsuccessful' }
    end
  end
end
