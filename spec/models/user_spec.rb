# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :google_id }
    it { is_expected.to validate_presence_of :auth_token }
    it { is_expected.to validate_presence_of :token_expiration }
  end

  describe 'relationships' do
    it { is_expected.to have_many :game_nights }
    it { is_expected.to have_many :friends }
    it { is_expected.to have_many(:buds).through :friends }
    it { is_expected.to have_many :invitations }
  end

  describe 'instance methods' do
    it '#get_game_nights' do
      user_1 = create(:user)
      user_2 = create(:user)

      Friend.create(user_id: user_1.id, bud_id: user_2.id)
      Friend.create(user_id: user_2.id, bud_id: user_1.id)

      game_1 = create :game
      game_2 = create :game

      UserGame.create(user_id: user_1.id, game_id: game_1.id)
      UserGame.create(user_id: user_2.id, game_id: game_2.id)

      game_night = GameNight.create!(
        user_id: user_1.id,
        name: 'Friday Fun Night',
        date: '1/15/2021',
        number_of_games: 2
      )

      Invitation.create!(
        status: 'pending',
        user_id: user_2.id,
        game_night_id: game_night.id
      )

      game_night_2 = GameNight.create!(
        user_id: user_2.id,
        name: 'Thursday Fun Night',
        date: '2/15/2021',
        number_of_games: 2
      )

      Invitation.create!(
        status: 'accepted',
        user_id: user_1.id,
        game_night_id: game_night_2.id
      )

      expect(user_1.get_game_nights.sort).to eq([game_night, game_night_2].sort)
    end
  end
end
