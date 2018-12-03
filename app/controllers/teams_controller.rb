class TeamsController < ApplicationController

  def show
    @team = TeamService.find_team(params[:id])
    @matches = TeamService.get_matches(params[:id])
    if @matches != "ERRORS"
      json = @matches.to_json
      respond_to do |format|
      format.html { render :show }
      format.json { render json: json }
      end
    else
      render json: {status: "error", code: 3000, message: "Too many requests. Please try again in one minute"}
    end 
  end

end
