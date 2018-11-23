class LeaguesController < ApplicationController

  def index
    #show the 6 leagues
    #hard code them to avoid unecessary requests to external API
  end

  def show
    #use a service object to request and find resouce on external API
    #code service object methods
  end

  def next_matches
    #find the current matchday for the league
    #display only the most immidiate upcoming matches
    #render action: all matches?? -> all_matches view???
  end

  def scheduled_matches
    #/leagues/:id/matches/schduled

    #find ALL SCHEDULED matches for the league
    #display all the upcoming matches
    #render action: all matches?? -> all_matches view???
    league = params[:id]
    url = "https://api.football-data.org/v2/competitions/#{league}/matches?status=SCHEDULED"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end
    body = JSON.parse(resp.body)

    if resp.success?
      @matches = body["matches"]
    else
      @error = body["meta"]["errorDetail"]
    end

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: resp.body }
    end

  end

  def all_matches
    #find ALL matches for the league; past and future for the current year
    #display all matches
    league = params[:id]
    matchday = params[:matchday]
    url = "https://api.football-data.org/v2/competitions/#{league}/matches?matchday=#{matchday}"
    resp = Faraday.get url do |req|
      req.headers['X-Auth-Token'] = ENV['AUTH_TOKEN']
    end
    body = JSON.parse(resp.body)

    if resp.success?
      @response = body["matches"]
    else
      @response = body["meta"]["errorDetail"]
    end

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: resp.body }
    end
  end

end
