# frozen_string_literal: true

require 'rails_helper'

describe Invitation, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :game_night_id }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :game_night }
    it { should validate_presence_of :status }
    it { should validate_presence_of :game_night_id }
    it { should validate_presence_of :user_id }
  end
end
