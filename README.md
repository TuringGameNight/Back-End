# Game Night API

[![Build Status](https://travis-ci.com/TuringGameNight/Back-End.svg?branch=main)](https://travis-ci.com/TuringGameNight/Back-End)

## Table of Contents

  - [What it does](#what-it-does)
  - [Technology](#technology)
  - [How to Install](#how-to-install)
  - [Testing](#testing)
  - [Endpoints](#endpoints)
  - [Project Leads](#project-leads)
  - [Acknowledgments](#acknowledgments)
  
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

### Users

#### Friends
```
List all friends for a specific user.

GET /api/v1/users/{user_id}/friends
```
```json
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
- /api/v1/users/:id/game-nights -> Returns a list of a user's game nights

### Games

```
Search for a game. This search will return 20 results based on the name parameter.

GET /api/v1/games/find

Parameter      Type        Description

name           string      The name of the game you want to search for
```

### Game Nights
- /api/v1/game_nights/1 -> Returns data on a game night

## Project Leads

- Austin Aspaas
- Eduardo Parra
- Garrett Cottrell
- Grant Dempsey
- Greg Mitchell
- Kate Tester
- Philip DeFraties
- Shaunda Cunningham
- Taylor Phillips

## Acknowledgments
