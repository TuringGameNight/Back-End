# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Game Night Invitations' do
  before :each do
    @user_1 = create :user
    @user_2 = create :user
    @user_3 = create :user
    @user_4 = create :user

    Friend.create(user_id: @user_1.id, bud_id: @user_2.id)
    Friend.create(user_id: @user_2.id, bud_id: @user_1.id)
    Friend.create(user_id: @user_3.id, bud_id: @user_1.id)
    Friend.create(user_id: @user_1.id, bud_id: @user_3.id)

    @game_1 = create :game
    @game_2 = create :game
    @game_3 = create :game

    UserGame.create(user_id: @user_1.id, game_id: @game_1.id)
    UserGame.create(user_id: @user_2.id, game_id: @game_2.id)
    UserGame.create(user_id: @user_3.id, game_id: @game_3.id)

    @game_night = GameNight.create!(
      user_id: @user_1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    @game_night_2 = GameNight.create!(
      user_id: @user_2.id,
      name: 'Thursday Fun Night',
      date: '2/15/2021',
      number_of_games: 2
    )

    @game_night_3 = GameNight.create!(
      user_id: @user_3.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    Invitation.create!(
      status: 'pending',
      user_id: @user_2.id,
      game_night_id: @game_night.id
    )

    Invitation.create!(
      status: 'pending',
      user_id: @user_2.id,
      game_night_id: @game_night_2.id
    )

    Invitation.create!(
      status: 'accepted',
      user_id: @user_2.id,
      game_night_id: @game_night_3.id
    )
  end
  it "it returns a list of pending game night invitations for a user" do

    get "/api/v1/users/#{@user_2.id}/invitations"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(json[:data].count).to eq(2)

    invitations_response_checker(json[:data], @user_2.get_pending_invitations)
  end

  it "it returns an empty response if the user has no invites" do

    get "/api/v1/users/#{@user_4.id}/invitations"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(json[:data].count).to eq(0)

    invitations_response_checker(json[:data], @user_2.get_pending_invitations)
  end
end
