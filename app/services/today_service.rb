class TodayService

  def self.matches_today(query)
    url = "https://api.football-data.org/v2/matches?#{query}"
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

end