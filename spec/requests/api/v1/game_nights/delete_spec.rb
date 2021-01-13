# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Game Night' do
  it 'can delete a game night' do
    game_night = create(:game_night)

    expect(GameNight.all).to eq([game_night])

    delete api_v1_game_night_path(game_night.id)

    expect(GameNight.all).to eq([])
  end

  it 'returns josn error if not found' do
    delete api_v1_game_night_path(80_000)

    json_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(json_body).to have_key(:message)
    expect(json_body[:message]).to eq('unsuccessful')
    expect(json_body).to have_key(:error)
    expect(json_body[:error]).to eq("Couldn't find GameNight with 'id'=80000")
  end
end
