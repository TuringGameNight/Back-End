require 'rails_helper'

describe GameNight, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :date }
    it { should validate_presence_of :number_of_games }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :invitations }
    it { should have_many(:users).through(:invitations) }
  end

  describe 'instance methods' do
    before :each do
      @user_1 = create :user
      @user_2 = create :user

      Friend.create(user_id: @user_1.id, bud_id: @user_2.id)
      Friend.create(user_id: @user_2.id, bud_id: @user_1.id)

      @game_1 = create :game
      @game_2 = create :game

      UserGame.create(user_id: @user_1.id, game_id: @game_1.id)
      UserGame.create(user_id: @user_1.id, game_id: @game_2.id)
      UserGame.create(user_id: @user_2.id, game_id: @game_2.id)

      @gn = GameNight.create!(
        user_id: @user_1.id,
        name:'Friday Fun Night',
        date: '1/15/2021',
        number_of_games: 2)

      Invitation.create!(user_id: @user_2.id, game_night_id: @gn.id, status: 'pending')
    end

    it '#games_to_play' do
      expect(@gn.games_to_play).to eq([@game_1, @game_2])
      expect(@gn.games_to_play).to_not eq([@game_1, @game_2, @game_2])
    end

    it '#attendees' do
      expect(@gn.attendees.sort).to eq([@user_1, @user_2].sort)
    end
  end
end
