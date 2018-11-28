class LeaguesController < ApplicationController

  def index
    #show the 6 leagues
    #hard code them to avoid unecessary requests to external API
  end

  def show
    @league = LeagueService.find_league(params[:id])
    json = @league.to_json

    repond_to do |format|
      format.html { render :show }
      format.json { render json: json }
    end
  end

  def teams
    @teams = LeagueService.get_teams(params[:id])
    json = @teams.to_json

    respond_to do |format|
      format.html { render :teams }
      format.json { render json: json}
    end
  end

  def next_matches
    @league_name = LeagueService.get_league_name(params[:id])
    matchday = LeagueService.get_matchday(params[:id])   
    query = "matchday=#{matchday}"
    @matches = LeagueService.get_matches(params[:id], query)
    
    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end

  def scheduled_matches
    @league_name = LeagueService.get_league_name(params[:id])
    query = "status=SCHEDULED"
    @matches = LeagueService.get_matches(params[:id], query)
    
    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end

  def all_matches
    @league_name = LeagueService.get_league_name(params[:id])
    @matches = LeagueService.get_matches(params[:id])

    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end


end
