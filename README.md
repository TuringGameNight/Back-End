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
- users/:id/friends -> Returns a list of friends names and email addresses
> ![image](https://user-images.githubusercontent.com/58994078/104082818-72842680-51f6-11eb-9143-85baaaa50e42.png)

- http://localhost:3000/api/v1/games/find.chess -> Returns a list of games
> ![image](https://user-images.githubusercontent.com/58994078/104083285-9a758900-51fa-11eb-820c-035d2a4ce459.png)

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
