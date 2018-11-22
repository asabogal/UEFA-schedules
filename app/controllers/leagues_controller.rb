class LeaguesController < ApplicationController

  def index
    #show the 6 leagues
    #hard code them to avoid unecessary requests to external API
  end

  def show
    #use a service object to request and find resouce on external API
    #code service object methods
  end

  def next_matches
    #find the current matchday for the league
    #display only the most immidiate upcoming matches
    #render action: all matches?? -> all_matches view???
  end

  def scheduled_matches
    #find ALL SCHEDULED matches for the league
    #display all the upcoming matches
    #render action: all matches?? -> all_matches view???
  end

  def all_matches
    #find ALL matches for the league; past and future for the current year
    #display all matches
  end

end
