class FriendsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
end
