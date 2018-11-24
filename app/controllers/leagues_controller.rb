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
    league = params[:id]
    matchday = LeagueService.get_matchday(league)
    token = ENV['AUTH_TOKEN']    
    query = "matchday=#{matchday}"
    @matches = LeagueService.get_matches(token, league, query)
    
    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
    
  end

  def scheduled_matches
    token = ENV['AUTH_TOKEN']
    league = params[:id]
    query = "status=SCHEDULED"
    @matches = LeagueService.get_matches(token, league, query)
    
    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end

  def all_matches
    token = ENV['AUTH_TOKEN']
    league = params[:id]
    @matches = LeagueService.get_matches(token, league)

    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end


end
