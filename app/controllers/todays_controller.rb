class TodaysController < ApplicationController

  def today
    today = DateTime.now.strftime("%Y-%e-%m")
    query = "#{today}"
    @matches = TodayService.matches_today(query)
      if @matches != "ERRORS"
        json = @matches.to_json
        respond_to do |format|
        format.html { render :today }
        format.json { render json: json }
        end
      else
        respond_to do |format|
        format.html { render "welcome/errors", layout: false }
        format.json { render json: {status: "error", code: 429, message: "Too many requests. Please try again in one minute"} }
      end
    end
  end

end
