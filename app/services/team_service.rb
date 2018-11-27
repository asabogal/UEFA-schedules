class TeamService

  def self.find_team(id)
    url = "https://api.football-data.org/v2/teams/#{id}"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end

    body = JSON.parse(resp.body)

    if resp.success?
      @response = body
    else
      @response = body["meta"]["errorDetails"]
    end

    @response
  end

end