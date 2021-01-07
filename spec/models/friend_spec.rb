require 'rails_helper'

describe Friend, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_id}
    it { should validate_presence_of :bud_id}
  end

  describe 'relationships' do
    it { should belong_to :user}
    it { should belong_to :bud}
  end
end
