# frozen_string_literal: true

require 'rails_helper'

describe Game, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :duration }
  end

  describe 'relationships' do
    it { should have_many :user_games }
    it { should have_many(:users).through(:user_games) }
  end

  describe 'class methods' do
    it '.find_game_db()' do
      game = create(:game, name: 'Everdell')

      expect(Game.find_game_db('Everdell')).to eq([game])
      expect(Game.find_game_db('Pandemic')).to eq([])
    end
  end
end
