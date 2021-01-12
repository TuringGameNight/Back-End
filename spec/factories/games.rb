FactoryBot.define do
  factory :game do
    name { Faker::Space.planet }
    game_type { Faker::Space.moon }
    description { Faker::Space.agency }
    age_range { "#{Faker::Number.between(from: 2, to: 17)}+" }
    duration { 90 }
    image { 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png' }
    num_players { Faker::Number.between(from: 2, to: 10) }
  end
end
