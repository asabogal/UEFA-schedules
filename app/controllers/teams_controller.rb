class TeamsController < ApplicationController

  def show
    @team = TeamService.find_team(params[:id])
    @matches = TeamService.get_matches(params[:id])
  
    json = @matches.to_json

    respond_to do |format|
      format.html { render :show }
      format.json { render json: json }
    end
  end

end
