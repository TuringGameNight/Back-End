FactoryBot.define do
  factory :game_night do
    user
    name { Faker::Lorem.word }
    date { Faker::Date.in_date_period }
    number_of_games { 2 }
  end
end
