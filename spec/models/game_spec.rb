require 'rails_helper'

describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :type}
    it { should validate_presence_of :description}
    it { should validate_presence_of :age_range}
    it { should validate_presence_of :duration}
    it { should validate_presence_of :user_id}
  end

  describe 'relationships' do
    it { should belong_to :user}
  end
end
