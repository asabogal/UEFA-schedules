class LeaguesController < ApplicationController

  def index
    #show the 6 leagues
    #hard code them to avoid unecessary requests to external API
  end

  def show
    @league = LeagueService.find_league(params[:id])
    json = @league.to_json

    respond_to do |format|
      format.html { render :show }
      format.json { render json: json }
    end
  end

  def teams
    league_data = LeagueService.get_teams(params[:id])
    @league_name = league_data["competition"]["name"]
    @teams = league_data["teams"]
 
    json = league_data.to_json
    
    respond_to do |format|
      format.html { render :teams }
      format.json { render json: json}
    end
  end

  def current_matches
    @league = LeagueService.find_league(params[:id])
      if params[:matchday]
        @matchday = params[:matchday].to_i
      else
        @matchday = @league["currentSeason"]["currentMatchday"] 
      end
     
    @query = "matchday=#{@matchday}"
    @league_name = @league["name"]
    @matches = LeagueService.get_matches(params[:id], @query)
   
    json = @league.to_json

    respond_to do |format|
      format.html { render :current_matches}
      format.json { render json: json }
      end
  end


  def scheduled_matches
    @league = LeagueService.find_league(params[:id])
    query = "status=SCHEDULED"
    @league_name = @league["name"]
    @matches = LeagueService.get_matches(params[:id], query)
    
    json = @matches.to_json

    respond_to do |format|
      format.html { render :scheduled_matches}
      format.json { render json: json }
      end
  end

  def all_matches
    @league = LeagueService.find_league(params[:id])
    @league_name = @league["name"]
    @matches = LeagueService.get_matches(params[:id])

    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end


end
