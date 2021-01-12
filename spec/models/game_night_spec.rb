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
    it { is_expected.to have_many :invitations }
    it { is_expected.to have_many(:users).through(:invitations) }
  end

  describe 'instance methods' do
    before do
      @user_1 = create :user
      @user_2 = create :user
      @user_3 = create :user

      Friend.create(user_id: @user_1.id, bud_id: @user_2.id)
      Friend.create(user_id: @user_2.id, bud_id: @user_1.id)
      Friend.create(user_id: @user_1.id, bud_id: @user_3.id)
      Friend.create(user_id: @user_3.id, bud_id: @user_1.id)

      @game_1 = create :game
      @game_2 = create :game

      UserGame.create(user_id: @user_1.id, game_id: @game_1.id)
      UserGame.create(user_id: @user_1.id, game_id: @game_2.id)
      UserGame.create(user_id: @user_2.id, game_id: @game_2.id)

      @gn = GameNight.create!(
        user_id: @user_1.id,
        name: 'Friday Fun Night',
        date: '1/15/2021',
        number_of_games: 2
      )

      Invitation.create!(user_id: @user_2.id, game_night_id: @gn.id, status: 'accepted')
      Invitation.create!(
        status: 'pending',
        user_id: @user_3.id,
        game_night_id: @gn.id
      )
    end

    it '#games_to_play' do
      expect(@gn.games_to_play.sort).to eq([@game_1, @game_2].sort)
      expect(@gn.games_to_play.sort).not_to eq([@game_1, @game_2, @game_2].sort)
    end

    it '#confirmed_attendees' do
      expect(@gn.confirmed_attendees.sort).to eq([@user_1, @user_2].sort)
    end

    it '#pending_attendees' do
      expect(@gn.pending_attendees.sort).to eq([@user_3].sort)
    end
  end
end
