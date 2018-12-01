class TodaysController < ApplicationController

  def today
    today = DateTime.now.strftime("%Y-%e-%m")
    query = "#{today}"
    @matches = TodayService.matches_today(query)

    json = @matches.to_json

    respond_to do |format|
      format.html { render :today }
      format.json { render json: json }
    end
  end

end
