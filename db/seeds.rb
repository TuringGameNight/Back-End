# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(name:"Kate",
            google_id: "lkawe4ljkn230asd",
            image: "",
            google_token: "awe3rl23412",
            refresh_token: "q2l34kladswf",
            auth_token: "asdflwerb123",
            email: "Kate@example.com")
