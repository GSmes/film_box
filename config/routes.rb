Rails.application.routes.draw do
  root to: 'films#index'

  resources :users, only: [:new, :create, :show]

  resources :films do
    resources :images
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :genres
    resources :images
  end
end
