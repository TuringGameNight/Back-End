# frozen_string_literal: true

require 'rails_helper'

describe GameNight, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :number_of_games }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { is_expected.to belong_to :user }
  end
end
