class TeamsController < ApplicationController
  
  def show
    @team = TeamService.find_team(params[:id])
    json = @team.to_json

    respond_to do |format|
      format.html { render :show }
      format.json { render json: json }
    end
  end

end
