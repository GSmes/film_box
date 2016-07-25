Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resources :films

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :genres
  end
end
