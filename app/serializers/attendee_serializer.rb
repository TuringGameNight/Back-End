class AttendeeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email
end
