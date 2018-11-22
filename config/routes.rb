Rails.application.routes.draw do
  root 'welcome#home'

  resources :leagues, only: [:index, :show]
  get '/leagues/:id/matches/next', to: 'leagues#next_matches', as: 'league_next_matches'
  get '/leagues/:id/matches/scheduled', to: 'leagues#scheduled_matches', as: 'league_scheduled_matches'
  get '/leagues/:id/matches/all', to: 'leagues#all_matches', as: 'league_all_matches'

end
