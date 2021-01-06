class RemoveFriendAddBudFromFriends < ActiveRecord::Migration[5.2]
  def change
    remove_column :friends, :friend_id
    add_reference :friends, :bud
  end
end
