# frozen_string_literal: true

require 'rails_helper'

describe Game, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :duration }
  end
end
