# Game Night API

[![Build Status](https://travis-ci.com/TuringGameNight/Back-End.svg?branch=main)](https://travis-ci.com/TuringGameNight/Back-End)

Plan your next game night with GameNight! With this app you can add games to your shelf, get your friends to do the same, and when it is time to plan a game night, leave the planning to us. We will get all the games collated and allow your party to vote on the game(s) you want to play before the game night!

![gamenight-logo2](https://user-images.githubusercontent.com/4582791/104680627-925f9280-56ad-11eb-9f2e-379b773a6320.png)

## Table of Contents

  - [What it does](#what-it-does)
  - [Technology](#technology)
  - [How to Install](#how-to-install)
  - [Schema](#schema)
  - [Endpoints](#endpoints)
  - [Roadmap](#roadmap)
  - [Contributors](#contributors)
  - [Acknowledgments](#acknowledgments)
  
## What It Does

This is the backend API that supports the Game Night application. You can find the Frontend of the application [here](https://github.com/TuringGameNight/Front-End), and checkout the microservice [here](https://github.com/TuringGameNight/Sinatra).



## Technology

This app is built on Rails 5.2 with support from:
- Faraday
- Fastjsonapi
- Figaro
- and a host of testing gems

## How to Install 

To install and run this application locally:

1. To setup the repository locally, clone it down and run the following commands:
```
$ bundle install
$ rails db:{create,migrate,seed}
```

2. Next, startup your server with the `$ rails server` command

3. You should now be able to open your web browser, navigate to `http://localhost:3000/` and see the Rails default information page.

4. From here, you are free to hit any of the api endpoints listed below. The URL should be prefixed with your localhost port like this `GET http://localhost:3000/api/v1/users/{user_id}/friends`

## Schema

<img src="https://i.ibb.co/SvHD61q/game-night-schema.png" alt="game-night-schema">

## Endpoints:

## Users

#### Friends
```
List all friends for a specific user.

GET /api/v1/users/{user_id}/friends
```
```json
Default response

{
    "data": [
        {
            "id": "2",
            "type": "friends",
            "attributes": {
                "name": "Austin",
                "email": "Austin@example.com"
            }
        },
        {
            "id": "3",
            "type": "friends",
            "attributes": {
                "name": "Phil",
                "email": "Phil@example.com"
            }
        }
    ]
}
```

```
Accept a friend request.

PATCH /api/v1/users/{user_id}/friends/{friends_user_id}
```

```
Send a friend request.

POST /api/v1/users/{user_id}/friends
```
```json
Raw JSON request body. The email will need to belong to an existing user.

{
    "friend_email": "joe@example.com"
}
```

```
Delete a game from a users shelf.

DELETE /api/v1/users/{user_id}/friends/{friends_user_id}
```


#### Games
```
List all games for a specific user.

GET /api/v1/users/{user_id}/games
```
```json
Default response

{
    "data": [
        {
            "id": "2",
            "type": "games",
            "attributes": {
                "name": "Pandemic",
                "game_type": "Board/Strategy",
                "description": "It is our life now",
                "duration": 95,
                "image": "IMAGE",
                "num_players": "4",
                "age_range": "15"
            }
        }
    ]
}
```

```
Add a game to a users shelf.

POST /api/v1/users/{user_id}/games
```
```json
Raw JSON request body

{
    "name": "Best Game Ever",
    "description": "Yes, it is the best game",
    "duration": 90,
    "game_type": "Board/Strategy", // optional
    "image": "www.hostingsite.com/yourimage", // optional
    "num_players": "4-6", // optional
    "age_range": "12+" // optional
}
```

```
Delete a game from a users shelf.

DELETE /api/v1/users/{user_id}/games/{game_id}
```

#### Game Nights
```
List all games nights a user is attending

GET /api/v1/users/{user_id}/game_nights
```
```json
Default response

{
    "data": [
        {
            "id": "1",
            "type": "user_game_night",
            "attributes": {
                "name": "Test Game Night",
                "date": "09-21-2021",
                "number_of_games": 2
            }
        }
    ]
}
```

#### Invitations
```
List all game night invitations for a user.

GET /api/v1/users/{user_id}/invitations
```
```json
Default response

{
    "data": [
        {
            "id": "1",
            "type": "invitation",
            "attributes": {
                "id": 1,
                "game_night": {
                    "game_night_id": 1,
                    "name": "Test Game Night",
                    "date": "09-21-2021",
                    "number_of_games": 2,
                    "host": "Kate",
                    "host_id": 1
                }
            }
        }
    ]
}
```

## Games

```
Search for a game. This search will return 20 results based on the name parameter.

GET /api/v1/games/find



Parameter      Type        Description

name           string      The name of the game you want to search for
```
```json
Default response

{
    "data": [
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue",
                "description": "<p>The classic detective game! In <strong>Clue</strong>, players move from room to room in a mansion to solve the mystery of: who done it, with what, and where? Players are dealt character, weapon, and location cards after the top card from each card type is secretly placed in the confidential file in the middle of the board. Players must move to a room and then make an accusation against a character saying they did it in that room with a specific weapon. The player to the left must show one of any cards accused to the accuser if in that player's hand. Through deductive reasoning each player must figure out which character, weapon, and location are in the secret file. To do this, each player must uncover what cards are in other players hands by making more and more accusations. Once a player knows what cards the other players are holding, they will know what cards are in the secret file. A great game for those who enjoy reasoning and thinking things out.</p>",
                "age_range": "8+",
                "duration": 60,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559254847936-611WyTryCvL.jpg",
                "num_players": "3-6",
                "game_type": "Deduction, Family Game"
            }
        }
    ]
}
```

## Game Nights

```
Return information for a specific game night

GET /api/v1/game_nights/{game_night_id}
```
```json
Default response

{
    "data": {
        "id": "1",
        "type": "game_night",
        "attributes": {
            "name": "Test Game Night",
            "date": "09-21-2021",
            "number_of_games": 2,
            "games": [
                {
                    "id": 1,
                    "name": "Chess",
                    "game_type": "Board/Strategy",
                    "description": "Timeless",
                    "duration": 15,
                    "image": "Knight",
                    "created_at": "2021-01-13T00:02:09.366Z",
                    "updated_at": "2021-01-13T00:02:09.366Z",
                    "num_players": "2",
                    "age_range": "6"
                },
                {
                    "id": 2,
                    "name": "Pandemic",
                    "game_type": "Board/Strategy",
                    "description": "It is our life now",
                    "duration": 95,
                    "image": "IMAGE",
                    "created_at": "2021-01-13T00:02:09.369Z",
                    "updated_at": "2021-01-13T00:02:09.369Z",
                    "num_players": "4",
                    "age_range": "15"
                }
            ],
            "attendees": [
                {
                    "name": "Austin",
                    "email": "Austin@example.com"
                },
                {
                    "name": "Phil",
                    "email": "Phil@example.com"
                },
                {
                    "name": "Kate",
                    "email": "Kate@example.com"
                }
            ]
        }
    }
}

```

```
Update a game night.

PATCH /api/v1/game_nights/{game_night_id}

```
```json
Raw JSON request body

{
    "name": "Test Game Night", // optional
    "date": "01-21-2021" // optional
}
```

```
Delete a game night.

DELETE /api/v1/game_nights/{game_night_id}
```

## Roadmap

See the [open issues](https://github.com/TuringGameNight/Back-End/issues) for a list of proposed features, known issues, and project extensions.

## Contributors

- Austin Aspaas - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/austin-aspaas-4626611bb/) - [![GitHub][github-shield]](https://github.com/evilaspaas1)
- Eduardo Parra - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/eduardo--parra/) - [![GitHub][github-shield]](https://github.com/helloeduardo)
- Garrett Cottrell - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/garrett-cottrell-52850834/) - [![GitHub][github-shield]](https://github.com/GarrettCottrell)
- Grant Dempsey - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/grant-dempsey-8a9a16169/) - [![GitHub][github-shield]](https://github.com/GDemps)
- Greg Mitchell - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/gregory-j-mitchell/) - [![GitHub][github-shield]](https://github.com/GregJMitchell)
- Kate Tester - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/katemorris/) - [![GitHub][github-shield]](https://github.com/katemorris)
- Philip DeFraties - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/philip-defraties/) - [![GitHub][github-shield]](https://github.com/PhilipDeFraties)
- Shaun James - [![LinkedIn][linkedin-shield]](https://github.com/ShaunDaneJames) - [![GitHub][github-shield]](https://www.linkedin.com/in/shaun-james-2707a61bb/)
- Shaunda Cunningham - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/shaunda-cunningham/) - [![GitHub][github-shield]](https://github.com/smcunning)
- Taylor Phillips - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/taphill/) - [![GitHub][github-shield]](https://github.com/taphill)

## Acknowledgments

Thank you to the [Board Game Atlas API](https://www.boardgameatlas.com/api/docs) for providing the board game data that this project relies on.

<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[github-shield]: https://img.shields.io/badge/-GitHub-black.svg?style=flat-square&logo=github&colorB=555
