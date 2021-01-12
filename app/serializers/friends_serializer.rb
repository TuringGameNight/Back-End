# frozen_string_literal: true

class FriendsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :status
end
