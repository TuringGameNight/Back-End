require 'rails_helper'

describe GameNight, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :date }
    it { should validate_presence_of :number_of_games }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
