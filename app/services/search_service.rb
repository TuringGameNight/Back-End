class SearchService
  def self.get_games_list_by_name(query)
    conn.get("/api/v1/search?name=#{query}").body
  end

  def self.conn
    Faraday.new((ENV['SINATRA_URL']).to_s)
  end
end
