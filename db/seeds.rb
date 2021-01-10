# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Friend.destroy_all
Game.destroy_all

kate = User.create(name: 'Kate',
                   google_id: 'lkawe4ljkn230asd',
                   image: '',
                   google_token: 'awe3rl23412',
                   refresh_token: 'q2l34kladswf',
                   auth_token: 'asdflwerb123',
                   email: 'Kate@example.com')

austin = User.create(name: 'Austin',
                     google_id: 'asdfq234wraswdf',
                     image: '',
                     google_token: 'asdf34qasdf',
                     refresh_token: '21354q12efraswdf',
                     auth_token: 'q234rdf',
                     email: 'Austin@example.com')

phil = User.create(name: 'Phil',
                   google_id: 'asdfq234wraswdf',
                   image: '',
                   google_token: 'asdf34qasdf',
                   refresh_token: '21354q12efraswdf',
                   auth_token: 'q234rdf',
                   email: 'Phil@example.com')

Friend.create(user_id: kate.id, bud_id: austin.id)
Friend.create(user_id: kate.id, bud_id: phil.id)

chess = Game.create(name: 'Chess',
                    game_type: 'Board/Strategy',
                    description: 'Timeless',
                    duration: 15,
                    image: 'Knight',
                    num_players: '2',
                    age_range: 6)
