require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'class methods' do
    it '.find_games_by_name()' do
      VCR.use_cassette("pandemic_game_search") do
        query = "Pandemic"
        response = SearchFacade.find_games_by_name(query)

        expect(response).to be_a String

        results = JSON.parse(response, symbolize_names: true)[:data]

        expect(results).to be_a Array
        expect(results.count).to be_between(20,100)
      end
    end
  end
end
