# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Invitations' do
  it 'can update an invitation status to accepted' do
    user1 = create :user
    user2 = create :user

    Friend.create(user_id: user1.id, bud_id: user2.id)
    Friend.create(user_id: user2.id, bud_id: user1.id)

    game1 = create :game

    UserGame.create(user_id: user1.id, game_id: game1.id)

    game_night = GameNight.create!(
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    invitation = Invitation.create!(
      status: 'pending',
      user_id: user2.id,
      game_night_id: game_night.id
    )

    invite_data = {
      status: 'accepted',
      user_id: user2.id,
      game_night_id: game_night.id
    }

    expect(game_night.confirmed_attendees).to eq([user1])

    patch "/api/v1/invitations/#{invitation.id}", params: invite_data

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(202)

    expect(user2.invitations.first.status).to eq('accepted')

    expect(game_night.confirmed_attendees).to eq([user2, user1])
  end

  it 'can update an invitation status to declined' do
    user1 = create :user
    user2 = create :user

    Friend.create(user_id: user1.id, bud_id: user2.id)
    Friend.create(user_id: user2.id, bud_id: user1.id)

    game1 = create :game

    UserGame.create(user_id: user1.id, game_id: game1.id)

    game_night = GameNight.create!(
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    invitation = Invitation.create!(
      status: 'pending',
      user_id: user2.id,
      game_night_id: game_night.id
    )

    invite_data = {
      status: 'declined',
      user_id: user2.id,
      game_night_id: game_night.id
    }

    expect(game_night.confirmed_attendees).to eq([user1])

    patch "/api/v1/invitations/#{invitation.id}", params: invite_data

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(202)

    expect(user2.invitations.first.status).to eq('declined')

    expect(game_night.confirmed_attendees).to eq([user1])
  end

  it 'responds with error message if update fails' do
    user1 = create :user
    user2 = create :user

    Friend.create(user_id: user1.id, bud_id: user2.id)
    Friend.create(user_id: user2.id, bud_id: user1.id)

    game1 = create :game

    UserGame.create(user_id: user1.id, game_id: game1.id)

    game_night = GameNight.create!(
      user_id: user1.id,
      name: 'Friday Fun Night',
      date: '1/15/2021',
      number_of_games: 2
    )

    invitation = Invitation.create!(
      status: 'pending',
      user_id: user2.id,
      game_night_id: game_night.id
    )

    invite_data = {
      status: 'pending',
      user_id: user2.id,
      game_night_id: game_night.id
    }

    expect(game_night.confirmed_attendees).to eq([user1])

    patch "/api/v1/invitations/#{invitation.id}", params: invite_data

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(422)

    expect(user2.invitations.first.status).to eq('pending')

    expect(game_night.confirmed_attendees).to eq([user1])
  end
end
