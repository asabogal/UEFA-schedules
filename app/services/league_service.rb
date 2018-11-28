class LeagueService

  def self.find_league(id)
    url = "https://api.football-data.org/v2/competitions/#{id}"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end

    body = JSON.parse(resp.body)

    if resp.success?
    @response = body
    else
    @response = body["meta"]["errorDetail"]
    end

    @response
  end

  def self.get_matches(league, query="")
    url = "https://api.football-data.org/v2/competitions/#{league}/matches?#{query}"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end

    body = JSON.parse(resp.body)

    if resp.success?
    @response = body["matches"]
    else
    @response = body["meta"]["errorDetail"]
    end

    @response
  end

  def self.get_league_name(league)
    url = "https://api.football-data.org/v2/competitions/#{league}"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end

    body = JSON.parse(resp.body)

    league_name = body["name"]
    league_name
    end

  def self.get_matchday(league)
    url = "https://api.football-data.org/v2/competitions/#{league}"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end

    body = JSON.parse(resp.body)

    @matchday = body["currentSeason"]["currentMatchday"]
    @matchday
    end

    def self.get_teams(league)
      url = "https://api.football-data.org/v2/competitions/#{league}/teams"
      resp = Faraday.get url do |req|
        req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
      end

        body = JSON.parse(resp.body)

        @teams = body["teams"]
        @teams
      
    end

end