# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchService do
  describe 'class methods' do
    it '.get_games_list_by_name()' do
      VCR.use_cassette('pandemic_game_search') do
        query = 'Pandemic'
        response = SearchService.get_games_list_by_name(query)

        expect(response).to be_a String

        results = JSON.parse(response, symbolize_names: true)[:data]

        expect(results).to be_a Array
        expect(results.count).to be_between(20, 100)
      end
    end
  end
end
