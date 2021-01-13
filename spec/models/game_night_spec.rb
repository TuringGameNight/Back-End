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
      @user1 = create :user
      @user2 = create :user
      @user3 = create :user

      Friend.create(user_id: @user1.id, bud_id: @user2.id)
      Friend.create(user_id: @user2.id, bud_id: @user1.id)
      Friend.create(user_id: @user1.id, bud_id: @user3.id)
      Friend.create(user_id: @user3.id, bud_id: @user1.id)

      @game1 = create :game
      @game2 = create :game

      UserGame.create(user_id: @user1.id, game_id: @game1.id)
      UserGame.create(user_id: @user1.id, game_id: @game2.id)
      UserGame.create(user_id: @user2.id, game_id: @game2.id)

      @gn = GameNight.create!(
        user_id: @user1.id,
        name: 'Friday Fun Night',
        date: '1/15/2021',
        number_of_games: 2
      )

      Invitation.create!(user_id: @user2.id, game_night_id: @gn.id, status: 'accepted')
      Invitation.create!(
        status: 'pending',
        user_id: @user3.id,
        game_night_id: @gn.id
      )
    end

    it '#games_to_play' do
      expect(@gn.games_to_play.sort).to eq([@game1, @game2].sort)
      expect(@gn.games_to_play.sort).not_to eq([@game1, @game2, @game2].sort)
    end

    it '#confirmed_attendees' do
      expect(@gn.confirmed_attendees.sort).to eq([@user1, @user2].sort)
    end

    it '#pending_attendees' do
      expect(@gn.pending_attendees.sort).to eq([@user3].sort)
    end
  end
end
