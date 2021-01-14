class FriendsFacade
  def self.create_friendship(user_id, friend_email)
    user = User.find(user_id)
    friend = User.find_by(email: friend_email)

    if !friend.nil? && user.id != friend.id
      Friend.create(user_id: user.id, bud_id: friend.id)
      FriendsSerializer.new(user)
    else
      { message: 'unsuccessful' }
    end
  end

  def self.accept_friendship(user_id, bud_id)
    find_and_accept_friend(user_id, bud_id)
    find_and_serialize_user(user_id)
  end

private

  def self.find_and_serialize_user(user_id)
    user = User.find(user_id)
    FriendsSerializer.new(user)
  end

  def self.find_and_accept_friend(user_id, bud_id)
    friend = Friend.find_by(user_id: user_id, bud_id: bud_id)
    friend.status = 'accepted'
    friend.save
  end
end
