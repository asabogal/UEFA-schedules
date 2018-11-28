class TodaysController < ApplicationController

  def today
    @matches = TodayService.matches_today

    json = @matches.to_json

    respond_to do |format|
      format.html { render :today }
      format.json { render json: json }
    end
  end

end
