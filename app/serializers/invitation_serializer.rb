# frozen_string_literal: true

class InvitationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :game_night do |invitation|
    {
      game_night_id: invitation.game_night.id,
      name: invitation.game_night.name,
      date: invitation.game_night.date,
      number_of_games: invitation.game_night.number_of_games,
      host: invitation.game_night.user.name,
      host_id: invitation.game_night.user.id
    }
  end
end
