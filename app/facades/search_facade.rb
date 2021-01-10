class SearchFacade
  def self.find_games_by_name(query)
    SearchService.get_games_list_by_name(query)
  end
end
