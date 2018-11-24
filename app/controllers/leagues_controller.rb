class LeaguesController < ApplicationController

  def index
    #show the 6 leagues
    #hard code them to avoid unecessary requests to external API
  end

  def show
   @league = LeagueService.find_league(params[:id])
  end

  def next_matches
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
    query = "status=SCHEDULED"
    @matches = LeagueService.get_matches(params[:id], query)
    
    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end

  def all_matches
    @matches = LeagueService.get_matches(params[:id])

    json = @matches.to_json

    respond_to do |format|
      format.html { render :all_matches}
      format.json { render json: json }
      end
  end


end
