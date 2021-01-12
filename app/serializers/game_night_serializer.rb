class GameNightSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :number_of_games

  attribute :games do |game_night|
    game_night.games_to_play.each do |game|
      game
    end
  end

  attribute :attendees do |game_night|
    game_night.attendees.map do |attendee|
      {
        name: attendee.name,
        email: attendee.email
      }
    end
  end
end
