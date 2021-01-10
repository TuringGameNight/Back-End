FactoryBot.define do
  factory :game do
    name { Faker::Game.title }
    game_type { Faker::Game.genre }
    description { Faker::Lorem.sentence }
    age_range { "1 - 5000" }
    duration { 60 }
    image { Faker::LoremFlickr.image }
    num_players { "4" }
  end
end
