class TodayService

  def self.matches_today
    url = "https://api.football-data.org/v2/matches"
    resp = Faraday.ger url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end

    body = JSON.parse(resp.body)

    body

  end

end