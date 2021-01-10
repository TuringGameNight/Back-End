require 'rails_helper'

describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :game_type }
    it { should validate_presence_of :description }
    it { should validate_presence_of :age_range }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :num_players }
  end

  describe 'relationships' do
    it {should have_many :user_games }
    it {should have_many(:users).through(:user_games) }
  end

  describe 'class methods' do
    it '.find_game_db()' do
      game = create(:game, name: 'Everdell')

      expect(Game.find_game_db('Everdell')).to eq([game])
      expect(Game.find_game_db('Pandemic')).to eq([])
    end
  end
end
