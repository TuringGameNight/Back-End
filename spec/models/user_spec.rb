require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :google_id }
    it { should validate_presence_of :google_token }
    it { should validate_presence_of :refresh_token }
    it { should validate_presence_of :auth_token }
  end

  describe "relationships" do
    it { should have_many :game_nights }
    it { should have_many :friends}
    it { should have_many(:buds).through :friends}
    it { should have_many :invitations}
  end
end
