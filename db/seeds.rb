# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GameNight.destroy_all
User.destroy_all
Game.destroy_all

kate = User.create!(name: 'Kate',
                    google_id: 'lkawe4ljkn230asd',
                    image: '',
                    token_expiration: 30,
                    refresh_token: 'q2l34kladswf',
                    auth_token: 'asdflwerb123',
                    email: 'Kate@example.com')

austin = User.create!(name: 'Austin',
                      google_id: 'asdfq234wraswdf',
                      image: '',
                      token_expiration: 30,
                      refresh_token: '21354q12efraswdf',
                      auth_token: 'q234rdf',
                      email: 'Austin@example.com')

phil = User.create!(name: 'Phil',
                    google_id: 'asdfq234wraswdf',
                    image: '',
                    token_expiration: 30,
                    refresh_token: '21354q12efraswdf',
                    auth_token: 'q234rdf',
                    email: 'Phil@example.com')

Friend.create!(user_id: kate.id, bud_id: austin.id)
Friend.create!(user_id: kate.id, bud_id: phil.id)

chess = Game.create!(name: 'Chess',
                     game_type: 'Board/Strategy',
                     description: 'Timeless',
                     duration: 15,
                     image: 'Knight',
                     num_players: '2',
                     age_range: 6)

pandemic = Game.create!(name: 'Pandemic',
                        game_type: 'Board/Strategy',
                        description: 'It is our life now',
                        duration: 95,
                        image: 'IMAGE',
                        num_players: '4',
                        age_range: 15)

UserGame.create!(user_id: kate.id, game_id: pandemic.id)
UserGame.create!(user_id: austin.id, game_id: chess.id)
UserGame.create!(user_id: phil.id, game_id: pandemic.id)
UserGame.create!(user_id: phil.id, game_id: chess.id)

gn = GameNight.create!(
  user_id: kate.id,
  name: 'Test Game Night',
  date: '09-21-2021',
  number_of_games: 2
)

Invitation.create!(game_night_id: gn.id, user_id: austin.id, status: 'pending')
Invitation.create!(game_night_id: gn.id, user_id: phil.id, status: 'pending')
