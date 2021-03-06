# frozen_string_literal: true

class GameNightSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :number_of_games

  attribute :games do |game_night|
    game_night.games_to_play.each do |game|
      game
    end
  end

  # Need to figure out how to just send name and email.
  attribute :confirmed_attendees do |game_night|
    game_night.confirmed_attendees.map do |attendee|
      {
        id: attendee.id,
        name: attendee.name,
        email: attendee.email
      }
    end
  end

  attribute :pending_attendees do |game_night|
    game_night.pending_attendees.map do |attendee|
      {
        id: attendee.id,
        name: attendee.name,
        email: attendee.email
      }
    end
  end
end
