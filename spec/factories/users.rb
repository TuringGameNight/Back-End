FactoryBot.define do
  factory :user do
    google_id { "Mashinawholebunchof2341234" }
    name { Faker::Ancient.god }
    image { "MyImage.jpeg" }
    google_token { "TOKEN" }
    refresh_token { "REFRESH_TOKEN" }
    auth_token { "AUTH_TOKEN" }
    email { Faker::Internet.email }
  end
end
