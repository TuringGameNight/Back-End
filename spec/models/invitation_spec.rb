require 'rails_helper'

describe Invitation, type: :model do
  describe 'validations' do
    it { should validate_presence_of :status }
    it { should validate_presence_of :game_night_id }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :game_night }
  end
end
