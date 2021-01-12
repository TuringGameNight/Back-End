# frozen_string_literal: true

module ResponseCheckers
  def user_response_checker(user_response, user)
    expect(user_response).to be_a(Hash)

    expect(user_response[:data]).to be_a(Hash)

    expect(user_response[:data]).to have_key(:id)
    expect(user_response[:data][:id]).to be_a(String)
    expect(user_response[:data][:id].to_i).to eq(user.id)

    expect(user_response[:data]).to have_key(:type)
    expect(user_response[:data][:type]).to be_a(String)
    expect(user_response[:data][:type]).to eq('user')
    expect(user_response[:data][:type].capitalize).to eq(user.class.to_s)

    expect(user_response[:data]).to have_key(:attributes)
    expect(user_response[:data][:attributes]).to be_a(Hash)

    expect(user_response[:data][:attributes]).to have_key(:id)
    expect(user_response[:data][:attributes][:id]).to be_an(Integer)
    expect(user_response[:data][:attributes][:id].to_i).to eq(user.id)

    expect(user_response[:data][:attributes]).to have_key(:name)
    expect(user_response[:data][:attributes][:name]).to be_a(String)
    expect(user_response[:data][:attributes][:name]).to eq(user.name)

    expect(user_response[:data][:attributes]).to have_key(:email)
    expect(user_response[:data][:attributes][:email]).to be_a(String)
    expect(user_response[:data][:attributes][:email]).to eq(user.email)

    expect(user_response[:data][:attributes]).to have_key(:image)
    expect(user_response[:data][:attributes][:image]).to be_a(String)
    expect(user_response[:data][:attributes][:image]).to eq(user.image)

    expect(user_response[:data][:attributes]).to have_key(:buds)
    expect(user_response[:data][:attributes][:buds]).to be_a(Array)

    expect(user_response[:data][:attributes]).to have_key(:games)
    expect(user_response[:data][:attributes][:games]).to be_a(Array)

    expect(user_response[:data][:attributes]).to have_key(:game_nights)
    expect(user_response[:data][:attributes][:game_nights]).to be_a(Array)
  end

  def user_game_nights_response_checker(user_gn_response, gn_1)
    expect(user_gn_response).to be_a(Hash)

    expect(user_gn_response[:data]).to be_a(Array)

    expect(user_gn_response[:data].first).to have_key(:id)
    expect(user_gn_response[:data].first[:id]).to be_a(String)
    expect(user_gn_response[:data].first[:id].to_i).to eq(gn_1.id)

    expect(user_gn_response[:data].first).to have_key(:type)
    expect(user_gn_response[:data].first[:type]).to be_a(String)
    expect(user_gn_response[:data].first[:type]).to eq('user_game_night')

    expect(user_gn_response[:data].first).to have_key(:attributes)
    expect(user_gn_response[:data].first[:attributes]).to be_a(Hash)

    expect(user_gn_response[:data].first[:attributes]).to have_key(:name)
    expect(user_gn_response[:data].first[:attributes][:name]).to be_a(String)
    expect(user_gn_response[:data].first[:attributes][:name]).to eq(gn_1.name)

    expect(user_gn_response[:data].first[:attributes]).to have_key(:date)
    expect(user_gn_response[:data].first[:attributes][:date]).to be_a(String)
    expect(user_gn_response[:data].first[:attributes][:date]).to eq(gn_1.date)

    expect(user_gn_response[:data].first[:attributes]).to have_key(:number_of_games)
    expect(user_gn_response[:data].first[:attributes][:number_of_games]).to be_a(Integer)
    expect(user_gn_response[:data].first[:attributes][:number_of_games]).to eq(gn_1.number_of_games)
  end

  def game_night_show_response_checker(game_night_data, game_night, user)

    expect(game_night_data[:data]).to have_key(:id)
    expect(game_night_data[:data][:id]).to be_an(String)

    expect(game_night_data[:data][:attributes]).to have_key(:name)
    expect(game_night_data[:data][:attributes][:name]).to be_an(String)
    expect(game_night_data[:data][:attributes][:name]).to eq(game_night.name)

    expect(game_night_data[:data][:attributes]).to have_key(:date)
    expect(game_night_data[:data][:attributes][:date]).to be_an(String)
    expect(game_night_data[:data][:attributes][:date]).to eq(game_night.date)

    expect(game_night_data[:data][:attributes]).to have_key(:number_of_games)
    expect(game_night_data[:data][:attributes][:number_of_games]).to be_an(Integer)
    expect(game_night_data[:data][:attributes][:number_of_games]).to eq(game_night.number_of_games)

    expect(game_night_data[:data][:attributes]).to have_key(:games)
    expect(game_night_data[:data][:attributes][:games].count).to eq(2)

    expect(game_night_data[:data][:attributes]).to have_key(:confirmed_attendees)
    expect(game_night_data[:data][:attributes][:confirmed_attendees]).to be_an(Array)

    expect(game_night_data[:data][:attributes]).to have_key(:pending_attendees)
    expect(game_night_data[:data][:attributes][:pending_attendees]).to be_an(Array)

  end
end
