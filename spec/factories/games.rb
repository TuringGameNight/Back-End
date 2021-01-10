FactoryBot.define do
  factory :game do
    name { "MyString" }
    game_type { "MyString" }
    description { "MyString" }
    age_range { "MyString" }
    duration { 1 }
    image { "MyString" }
    num_players { "2-4" }
  end
end
