# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20_210_108_234_232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'friends', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'bud_id'
    t.index ['bud_id'], name: 'index_friends_on_bud_id'
    t.index ['user_id'], name: 'index_friends_on_user_id'
  end

  create_table 'game_nights', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'name'
    t.string 'date'
    t.integer 'number_of_games'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_game_nights_on_user_id'
  end

  create_table 'games', force: :cascade do |t|
    t.string 'name'
    t.string 'game_type'
    t.string 'description'
    t.integer 'duration'
    t.string 'image'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'num_players'
    t.integer 'age_range'
  end

  create_table 'invitations', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'game_night_id'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_night_id'], name: 'index_invitations_on_game_night_id'
    t.index ['user_id'], name: 'index_invitations_on_user_id'
  end

  create_table 'user_games', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'game_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_id'], name: 'index_user_games_on_game_id'
    t.index ['user_id'], name: 'index_user_games_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'google_id'
    t.string 'name'
    t.string 'image'
    t.string 'google_token'
    t.string 'refresh_token'
    t.string 'auth_token'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email'
  end

  add_foreign_key 'friends', 'users'
  add_foreign_key 'game_nights', 'users'
  add_foreign_key 'invitations', 'game_nights'
  add_foreign_key 'invitations', 'users'
  add_foreign_key 'user_games', 'games'
  add_foreign_key 'user_games', 'users'
end
