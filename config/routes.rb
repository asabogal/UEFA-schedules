Rails.application.routes.draw do
  root 'welcome#home'

  resources :leagues, only: [:index, :show]
  get '/leagues/:id/matches/current', to: 'leagues#current_matches'
  get '/leagues/:id/matches/scheduled', to: 'leagues#scheduled_matches', as: 'league_scheduled_matches'
  get '/leagues/:id/matches/all', to: 'leagues#all_matches', as: 'league_all_matches'
  get 'leagues/:id/teams', to: 'leagues#teams', as: 'league_teams'

  get 'teams/:id', to: 'teams#show'

  get '/today', to: 'todays#today'

  resources :reviews, only: [:show, :create]
end
