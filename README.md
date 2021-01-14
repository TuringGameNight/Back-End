# Game Night API

[![Build Status](https://travis-ci.com/TuringGameNight/Back-End.svg?branch=main)](https://travis-ci.com/TuringGameNight/Back-End)

## Table of Contents

  - [What it does](#what-it-does)
  - [Technology](#technology)
  - [How to Install](#how-to-install)
  - [Testing](#testing)
  - [Endpoints](#endpoints)
  - [Contributors](#contributors)
  
## What It Does

This is the backend API that supports Game Night (about below).

NEED LINK
Main Game Night App: Plan your next game night with GameNight! With this app you can add games to your shelf, get your friends to do the same, and when it is time to plan a game night, leave the planning to us. We will get all the games collated and allow your party to vote on the game(s) you want to play before the game night!

## Technology

This app is built on Rails 5.2 with support from:
- Faraday
- Fastjsonapi
- Figaro
- and a host of testing gems

## How to Install 

To install and run this application locally:

1. To setup the repository locally, from your command line:
```
$git clone git@github.com:turinggamenight/Back-End.git
$bundle
$rails db:{create,migrate,seed}
```
2. To run it on your local server type 'rails s' into the command line:
```
$rails s
```
3. Open your web browser and navigate to http://localhost:3000/

4. Enter any of the endpoints listed to view the data available!

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

```
Delete a game from a users shelf.

DELETE /api/v1/users/{user_id}/games
```

#### Game Nights
```
List all games nights a user is attending

GET /api/v1/users/{user_id}/game_nights
```
```json
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

## Contributors

- Austin Aspaas
- Shaun James [GitHub](https://github.com/ShaunDaneJames) & [LinkedIn](https://www.linkedin.com/in/shaun-james-2707a61bb/)
- Eduardo Parra [GitHub](https://github.com/helloeduardo) & [LinkedIn](https://www.linkedin.com/in/eduardo--parra/)
- Garrett Cottrell
- Grant Dempsey
- Greg Mitchell
- Kate Tester
- Philip DeFraties
- Shaunda Cunningham
- Taylor Phillips [GitHub](https://github.com/taphill) & [LinkedIn](https://www.linkedin.com/in/taphill/)
