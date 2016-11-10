Rails.application.routes.draw do
  root 'home#index'

  post '/repo',   to: 'repo#create'
  delete '/repo', to: 'repo#destroy'


  get '/auth/github',               as: :github_login
  get '/auth/github/callback',      to: 'sessions#create'
  get '/logout',                    to: 'sessions#destroy', as: :logout
end
