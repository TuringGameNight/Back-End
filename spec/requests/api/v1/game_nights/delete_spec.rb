# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Game Night' do
  it 'can delete a game night' do
    game_night = create(:game_night)

    expect(GameNight.all).to eq([game_night])

    delete api_v1_game_night_path(game_night.id)

    expect(GameNight.all).to eq([])
  end
end
