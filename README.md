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
- /api/v1/users/:id/game-nights -> Returns a list of a user's game nights

### Games

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
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "13 Clues",
                "description": "<p>The city of London has been shaken by heinous crimes, and Scotland Yard is groping in the dark. 13 Clues, set at the end of the 19th century, puts players in the shoes of the detectives, each trying to solve their own mystery. Each player sees the clues - person + location + weapon - for the other players but not their own. They investigate by asking questions, by consulting the secret informant, and by making accusations in order to collect clues and rule out suspects. The goal of the game is to identify which of the 13 clues match their case before the others do!</p>",
                "age_range": "14+",
                "duration": 45,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1540939172028",
                "num_players": "2-6",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: The Great Museum Caper",
                "description": "Clue The Great Museum Caper board game from 1991. &quot;In this 3-D game of detection and evasion, one of you will play the invisible Thief and make all your moves in secret behind the Thief's Shield. The other players will work together to sniff out your whereabouts, lay chase, and prevent your getaway!&quot;\r\n\r\n2-4 players Ages 10 and up.",
                "age_range": "10+",
                "duration": 30,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257501214-51lugthammL.jpg",
                "num_players": "2-4",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: Harry Potter",
                "description": "<p>A fellow student has seemingly vanished from the famous School of Witchcraft and Wizardry - and it is up to you to solve the mysterious disappearance. Playing as Harry, Ron, Hermione, Ginny, Luna or Neville, you must try and discover WHO did it, WHAT spell or item they used and WHERE the student was attacked. <br /><br />Move around Hogwarts making suggestions...but watch out! Wheels on the board will keep changing revealing secret passages, moving staircases or even the Dark Mark! Protection from the Dark Mark comes from the spells, allies and items provided by the Help Cards. When you're sure of your facts go to Dumbledore's office to make your accusation and win the game!</p>",
                "age_range": "9+",
                "duration": 45,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1540938704411",
                "num_players": "3-5",
                "game_type": "Deduction, Family Game, Movies / TV / Radio theme"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue Suspect",
                "description": "<p>This is a fast-playing stripped down version of the classic boardgame, Clue. Basically it is the question portion of the game made with a specific set of cards used as the notepad. The detail list of cards varies from the original and the design is in line with the up to date style of nowadays.</p>\r\n<p>Play your cards right and you will solve it in no time.</p>\r\n<p>Ask question about the Clue characters weapons and locations on your cards to work out who did it, with what and where.</p>\r\n<p>As you expect, the first detective to solve the crime wins. It’s all the fun and intrigue of Clue, in minutes. Special 2 player game for top detectives!</p>",
                "age_range": "8+",
                "duration": 15,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1547598953289",
                "num_players": "3-4",
                "game_type": "Deduction, Family Game"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: The Golden Girls",
                "description": "<p>It's impossible to stay golden when there's no cheesecake. You had the whipped cream and chocolate sauce ready to go, only to discover that the last of the cheesecake's already been eaten. Now, ugly men and women might cry in your shoes, you but you are determined to get to the bottom of things.<br /><br />After you storm around the Home and accuse everyone in sight, everyone gathers in the living room, determined to prove their innocence and thrilled at the prospect of figuring out WHO ate the last piece of cheesecake, WHAT item they accidentally left as evidence, and WHERE they did it. Was it Stan perhaps, wolfing down the cheesecake in Dorothy's bedroom and forgetfully leaving behind his bathrobe? Or was it Blanche, overcome on the Lanai as indicated by the feathered slippers she let slip off her dainty feet?<br /><br />It's up to you to scour the Home and find out what really happened.<br /><br /><strong>Contents:</strong><br />Custom Game Board<br />6 Suspect Movers<em><br />  ‣ Dorothy<br />  ‣ Blanche<br />  ‣ Rose<br />  ‣ Sophia<br />  ‣ Stan<br />  ‣ Miles</em><br />6 Personality Cards<br />21 Rumor Cards<br />25 Distraction Cards<br />1 Score Pad<br />1 Envelope<br />6 Zinc Items<em><br />  ‣ Bathrobe<br />  ‣ Rattan Chair<br />  ‣ Lipstick<br />  ‣ Sophia's Purse<br />  ‣ Feathered Slipper<br />  ‣ Whipped Cream</em><br />2 Dice<br />Rules</p>",
                "age_range": "8+",
                "duration": 60,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1541181058044",
                "num_players": "2-6",
                "game_type": "Family Game, Movies / TV / Radio theme"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue Master Detective Board Game",
                "description": "<p>Was it Madame Rose in the Carriage House with the Poison? Monsieur Brunette in the Trophy Room with the Horseshoe? Or was it our old friend Colonel Mustard whodunit in the Library with his trusty service Revolver? You'll need your sharpest detective skills to solve the ever-changing CLUE MASTER DETECTIVE mystery, because in this expanded version of our classic game of detection, there are more rooms, more weapons, more suspects -- more mayhem! The late Mr. Boddy's country manor has a total of twelve possible Murder Locations, both outdoors and indoors, with secret passages, plus new &quot;Snoop Spaces&quot; that let you broaden your investigation. A vial of Poison and a Horseshoe bring the number of Weapons up to eight. And the devious bunch of Supsects has grown to ten with the addition of Miss Peach, Monsieur Brunette, Madame Rose and Sergeant Gray. With all these additional people, places and things to unravel, your most expert powers of interrogation and deduction will be called into play. So shuffle the Suspect, Weapon and Murder Location cards, slip one of each into the Confidential Case File envelope -- and start sleuthing! Turn by turn you probe, collecting evidence and pinpointing certain culprits, means, and rooms. Then, when you think you've got it, make your accusation: Whodunit? Where? With which weapon? CLUE MASTER DETECTIVE ... it's so entertaining, it's criminal!</p>",
                "age_range": "10+",
                "duration": 60,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559255100561-51T-al2quRL.jpg",
                "num_players": "2-10",
                "game_type": "Deduction, Family Game"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "50 Clues: White Sleep",
                "description": "<p>Maria is on the run with her son while also preparing for the big showdown. But will she make it? <em><strong>White Sleep</strong></em> is the second episode of the murderous trilogy about Maria.</p>\r\n<p><em><strong>50 Clues</strong></em> is an immersive puzzle game that offers the experience of an escape room, but in a format that can be played at home. You combine objects, solve puzzles and decipher codes to complete the story. A smartphone or tablet keeps track of the solutions and provides multistep hints if the need arises.</p>",
                "age_range": "16+",
                "duration": 90,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1578099407696",
                "num_players": "1-5",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Password",
                "description": "",
                "age_range": "10+",
                "duration": 30,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257687376-51jL0-f2BdoL.jpg",
                "num_players": "3-4",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Family Game Night Book and Game Set: Scrabble, Clue, Sorry, Yahtzee",
                "description": "The family that plays together really stays together-especially when they get to play great games like -CLUE, YAHTZEE, SCRABBLE AND SORRY. These have been among Hasbro's top selling games for generations, and now they are in one giant pack complete with instuctions, game pieces, gameboards, cards, and note pads- for your family to enjoy",
                "age_range": "8+",
                "duration": null,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257409350-5134xdDlKxL.jpg",
                "num_players": "2-6",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue / Mystery Bits with Question Mark",
                "description": "<p>Clue bits are approximately 15mm long, 15mm tall, and 5mm deep.</p>",
                "age_range": null,
                "duration": null,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1593127714104",
                "num_players": null,
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "ROLLICK!  The Hysterical Game of Clues and Collaboration",
                "description": "",
                "age_range": "10+",
                "duration": 20,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/empty+box.jpg",
                "num_players": "6-24",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: Game of Thrones",
                "description": "<p>High treachery and betrayal are behind the two mysteries to solve in Game of Thrones Clue. Featuring a double-sided game board, players choose to solve the murder mystery in The Red Keep or in Meereen. WHO was responsible for plotting the murder? WHAT weapon was used and WHERE did the crime take place?</p>",
                "age_range": "18+",
                "duration": 60,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559255053275-6180tLw7WzL.jpg",
                "num_players": "2-6",
                "game_type": "Deduction, Family Game, Movies / TV / Radio theme"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue/Parcheesi",
                "description": "Clue/Parcheesi.<br><br>Parcheesi Board Games 2 to 4 players ages 7 to adult./Clue Board game 3 to 6 players ages 8 to adult. A double game set in a tin.",
                "age_range": "8+",
                "duration": 45,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257584281-41w8SMZ7RuL.jpg",
                "num_players": "2-6",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue DVD Game",
                "description": "<p>Step out of your living room and into the mystery.</p>",
                "age_range": "10+",
                "duration": 60,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257694634-61WNgNQ32BaL.jpg",
                "num_players": "3-5",
                "game_type": "Deduction, Family Game"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "CLUE: Firefly Edition",
                "description": "",
                "age_range": "8+",
                "duration": 90,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1563290429379",
                "num_players": "3-6",
                "game_type": ""
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: The Simpsons",
                "description": "<p>The classic game of &quot;whodunnit&quot; comes to Springfield!</p>",
                "age_range": "8+",
                "duration": 45,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1576875338666",
                "num_players": "3-6",
                "game_type": "Deduction, Family Game, Movies / TV / Radio theme"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Haiclue",
                "description": "Combine word tiles to make clues. A game for 2-12 players.",
                "age_range": "14+",
                "duration": 30,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1565186611028",
                "num_players": "2-12",
                "game_type": "Kickstarter"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: Supernatural",
                "description": "<p>One of your favorite Supernatural characters has been possessed &amp; is commiting terrible deeds! Now is the time for you to become the hunter and attempt to discover - WHO is posessed WHAT mystical object was used to open the demon portal, and WHERE the portal was opened! Was it Sam with the Revolver in the Rocky Mountains? Or Dean on the West Coast with the Winchester Journal? Solve the mystery and victory will be yours!</p>",
                "age_range": "8+",
                "duration": 60,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1540938020805",
                "num_players": "3-6",
                "game_type": "Deduction, Family Game, Movies / TV / Radio theme"
            }
        },
        {
            "id": null,
            "type": "board_game",
            "attributes": {
                "name": "Clue: Bob's Burgers",
                "description": "<p>Bob's Burgers Clue features a custom illustrated game board, where players attempt to solve the crime of WHO killed &quot;Ned Boddy&quot; at Linda Belcher's dinner party, WHAT weapon did they leave at the scene of the crime, and WHICH room of the Belcher apartment did they do it in?</p>",
                "age_range": "8+",
                "duration": 120,
                "image": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1540940956211",
                "num_players": "3-6",
                "game_type": "Deduction, Family Game, Movies / TV / Radio theme"
            }
        }
    ]
}
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
