FactoryBot.define do
  factory :user do
    google_id { 'Mashinawholebunchof2341234' }
    name { Faker::Ancient.god }
    image { 'MyImage.jpeg' }
    refresh_token { 'REFRESH_TOKEN' }
    auth_token { 'AUTH_TOKEN' }
    email { Faker::Internet.email }
    token_expiration { Faker::Number.unique.number(digits: 8) }
  end
end
