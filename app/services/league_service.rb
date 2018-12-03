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
      @response = "ERRORS"
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
      @response = "ERRORS"
    end
    @response
  end


    def self.get_teams(id)
      url = "https://api.football-data.org/v2/competitions/#{id}/teams"
      resp = Faraday.get url do |req|
        req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
      end

      body = JSON.parse(resp.body)

      if resp.success?
        @response = body
        else
        @response = "ERRORS"
      end
      @response
    end

end