require 'rails_helper'

describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :game_type}
    it { should validate_presence_of :description}
    it { should validate_presence_of :age_range}
    it { should validate_presence_of :duration}
    it { should validate_presence_of :num_players }
  end

  describe 'relationships' do
    it {should have_many :user_games }
    it {should have_many(:users).through(:user_games) }
  end
end
