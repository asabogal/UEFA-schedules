class TodaysController < ApplicationController

  def today
    today = DateTime.now.strftime("%Y-%m-%e")
    query = "dateFrom=#{today}&dateTo=#{today}"
    @matches = TodayService.matches_today(query)["matches"]

    json = @matches.to_json

    respond_to do |format|
      format.html { render :today }
      format.json { render json: json }
    end
  end

end
