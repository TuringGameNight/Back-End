class SearchService
  def self.get_games_list_by_name(query)
    response = conn.get("/api/v1/search?name=#{query}").body
  end

  private

  def self.conn
    Faraday.new("#{ENV['SINATRA_URL']}")
  end
end
