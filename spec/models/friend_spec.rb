# frozen_string_literal: true

require 'rails_helper'

describe Friend, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :bud_id }
  end

  describe 'relationships' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :bud }
  end
end
