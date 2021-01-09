class SearchService
  # WRITE TESTS and this will need to be cleaned up
  def self.get_games_list_by_name(query)
    conn = Faraday.new("#{ENV['SINATRA_URL']}")
    response = conn.get("/api/v1/search?name=#{query}")
    response.body
  end
end
