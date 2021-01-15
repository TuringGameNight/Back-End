# frozen_string_literal: true

class FriendsFacade
  def self.create_friendship(user_id, friend_email)
    user = User.find(user_id)
    friend = User.find_by(email: friend_email)

    if friend && user.id != friend.id
      Friend.create(user_id: friend.id, bud_id: user.id, status: 'pending')
      Friend.create(user_id: user.id, bud_id: friend.id, status: 'sent')
      { message: 'successful' }
    else
      { message: 'unsuccessful' }
    end
  end

  def self.accept_friendship(user_id, bud_id)
    find_and_accept_friend(user_id, bud_id)
  end

  def self.find_and_accept_friend(user_id, bud_id)
    friend = Friend.find_by(user_id: user_id, bud_id: bud_id)
    reverse_friend = Friend.find_by(user_id: bud_id, bud_id: user_id)
    friend.status = 'accepted'
    reverse_friend.status = 'accepted'
    friend.save
    reverse_friend.save
    { message: 'successful' }
  end
end
