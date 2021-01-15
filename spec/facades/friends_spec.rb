# frozen_string_literal: true

require 'rails_helper'

describe FriendsFacade do
  describe 'class methods' do
    it '.create_friendship' do
      user = create(:user)
      friend = create(:user)

      response = FriendsFacade.create_friendship(user.id, friend.email)

      expect(response).to be_an_instance_of(FriendsSerializer)
    end
  end
end