# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :google_id }
    it { is_expected.to validate_presence_of :google_token }
    it { is_expected.to validate_presence_of :auth_token }
  end

  describe 'relationships' do
    it { is_expected.to have_many :game_nights }
    it { is_expected.to have_many :friends }
    it { is_expected.to have_many(:buds).through :friends }
    it { is_expected.to have_many :invitations }
  end
end
