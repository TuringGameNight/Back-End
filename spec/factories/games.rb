FactoryBot.define do
  factory :game do
    name { Faker::Space.planet }
    game_type { Faker::Space.moon }
    description { Faker::Space.agency }
    age_range { Faker::Number.between(from: 2, to: 17) }
    duration { 1 }
    image { 'MyString' }
    num_players { Faker::Number.between(from: 2, to: 10) }
  end
end
