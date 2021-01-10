require 'rails_helper'

describe UserGame, type: :model do
  describe 'validations' do
    it { should validate_presence_of :game_id }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :game }
  end
end
