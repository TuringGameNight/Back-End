# frozen_string_literal: true

class FriendsSerializer
  include FastJsonapi::ObjectSerializer

  attribute :accepted_friends do |user|
    user.get_accepted_buds.map do |bud|
      {
        id: bud.id,
        name: bud.name,
        email: bud.email
      }
    end
  end

  attribute :pending_friends do |user|
    user.get_pending_buds.map do |bud|
      {
        id: bud.id,
        name: bud.name,
        email: bud.email
      }
    end
  end
end
